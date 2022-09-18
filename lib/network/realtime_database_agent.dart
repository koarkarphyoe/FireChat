import 'dart:io';

import '../model/custom_object/custom_object.dart';

abstract class RealtimeDatabaseAgent {
  Stream<List<NewFeedCustomObject>> getNewFeedList();
  Future<void> addNewPost(NewFeedCustomObject newFeed);
  void deletePost(int postId);
  Future<NewFeedCustomObject> getNewFeedById(int id);
  Future<String> uploadImage(File image);
}
