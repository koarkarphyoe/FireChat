import 'dart:io';

import 'package:fire_chat/model/custom_object/user_vo.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/custom_object/custom_object.dart';

const newFeedPath = "newfeed";
const newUserPath = "users";

class RealtimeDatabaseAgentImpl extends RealtimeDatabaseAgent {
  //Singleton
  static final RealtimeDatabaseAgentImpl _singleton =
      RealtimeDatabaseAgentImpl._internal();
  factory RealtimeDatabaseAgentImpl() {
    return _singleton;
  }
  RealtimeDatabaseAgentImpl._internal();

  //Network call
  FirebaseDatabase database = FirebaseDatabase.instance;

  //Authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<List<NewFeedCustomObject>> getNewFeedList() {
    return database.ref(newFeedPath).onValue.map((databaseEvent) {
      List<NewFeedCustomObject> dataList = [];

      var newData = databaseEvent.snapshot.value as Map<dynamic, dynamic>;

      newData.forEach((key, value) {
        var data =
            NewFeedCustomObject.fromJson(Map<String, dynamic>.from(value));
        dataList.add(data);
      });

      return dataList;
    });
  }

  @override
  Future<void> addNewPost(NewFeedCustomObject newFeed) {
    return database
        .ref(newFeedPath)
        .child(newFeed.id.toString())
        .set(newFeed.toJson());
  }

  @override
  void deletePost(int postId) {
    database.ref(newFeedPath).child(postId.toString()).remove();
  }

  @override
  Future<NewFeedCustomObject> getNewFeedById(int id) {
    return database.ref(newFeedPath).child(id.toString()).once().then((value) {
      return NewFeedCustomObject.fromJson(
          Map<String, dynamic>.from(value.snapshot.value as dynamic));
    });
  }

  @override
  Future<String> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<void> registerNewUser(UserVo newUser) {
    return auth
        .createUserWithEmailAndPassword(
            email: newUser.userEmail ?? "",
            password: newUser.userPassword ?? "")
        .then((credential) =>
            credential.user?..updateDisplayName(newUser.userName))
        .then((user) {
      newUser.id = user?.uid ?? "";
      _addNewUserToRealtimeDatabase(newUser);
    });
  }

  Future<void> _addNewUserToRealtimeDatabase(UserVo newUser) {
    return database
        .ref(newUserPath)
        .child(newUser.id.toString())
        .set(newUser.toJson());
  }

  @override
  Future<void> loginUser(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  @override
  UserVo getLoggedInUser() {
    return UserVo(
        id: auth.currentUser!.uid,
        userEmail: auth.currentUser!.email,
        userName: auth.currentUser!.displayName);
  }
}
