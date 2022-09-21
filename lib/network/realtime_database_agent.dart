import 'dart:io';

import 'package:fire_chat/model/custom_object/user_vo.dart';

import '../model/custom_object/custom_object.dart';

abstract class RealtimeDatabaseAgent {
  //NewFeed
  Stream<List<NewFeedCustomObject>> getNewFeedList();
  Future<void> addNewPost(NewFeedCustomObject newFeed);
  void deletePost(int postId);
  Future<NewFeedCustomObject> getNewFeedById(int id);
  Future<String> uploadImage(File image);

  //Authentication
  Future<void> registerNewUser(UserVo newUser);
  Future<void> loginUser(String email, String password);
  bool isLoggedIn();
  UserVo getLoggedInUser();
}
