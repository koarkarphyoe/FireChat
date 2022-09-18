import 'dart:io';

import 'package:fire_chat/model/custom_object/custom_object.dart';

abstract class DataModel {
  Stream<List<NewFeedCustomObject>> getNewFeedList();
  Future<void> addNewPost(String description,File? image);
  void deletePost(int postId);
  Future<NewFeedCustomObject> getNewFeedById(int id);
  Future<void> editPost(NewFeedCustomObject editedNewFeed);
  Future<String> uploadImage(File image);
}
