import 'dart:io';
import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/model/custom_object/user_vo.dart';
import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:fire_chat/network/firebase_storage_agent_impl.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:fire_chat/network/realtime_database_agent_impl.dart';
import 'data_model.dart';

class DataModelImpl extends DataModel {
  static final DataModelImpl _singleton = DataModelImpl._internal();
  factory DataModelImpl() {
    return _singleton;
  }
  DataModelImpl._internal();

  //RealtimeDatabase
  RealtimeDatabaseAgent realtimeDatabaseAgent = RealtimeDatabaseAgentImpl();
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  //CloudFirestore
  // RealtimeDatabaseAgent realtimeDatabaseAgent = FirebaseStorageAgentImpl();

  @override
  Stream<List<NewFeedCustomObject>> getNewFeedList() {
    return realtimeDatabaseAgent.getNewFeedList();
  }

  @override
  Future<void> addNewPost(String description, File? image) {
    if (image != null) {
      return realtimeDatabaseAgent.uploadImage(image).then((imageLink) {
        return modifiedVOWithImageLink(description, imageLink).then((newFeed) {
          return realtimeDatabaseAgent.addNewPost(newFeed);
        });
      });
    } else {
      return modifiedVOWithImageLink(description, "").then((newFeed) {
        return realtimeDatabaseAgent.addNewPost(newFeed);
      });
    }
  }

  Future<NewFeedCustomObject> modifiedVOWithImageLink(
      String description, String imageLink) {
    var newId = DateTime.now().millisecondsSinceEpoch;
    var newFeed = NewFeedCustomObject(
        description,
        newId,
        imageLink,
        "https://c.wallhere.com/images/13/c5/4009382d8def55e9a6874212be0b-1561467.jpg!d",
        authenticationModel.getLoggedInUser().userName);
    return Future.value(newFeed);
  }

  @override
  void deletePost(int postId) {
    realtimeDatabaseAgent.deletePost(postId);
  }

  @override
  Future<NewFeedCustomObject> getNewFeedById(int id) {
    return realtimeDatabaseAgent.getNewFeedById(id);
  }

  @override
  Future<void> editPost(NewFeedCustomObject editedNewFeed) {
    return realtimeDatabaseAgent.addNewPost(editedNewFeed);
  }

  @override
  Future<String> uploadImage(File image) {
    return realtimeDatabaseAgent.uploadImage(image);
  }
}
