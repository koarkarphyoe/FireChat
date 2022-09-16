import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/custom_object/custom_object.dart';

const newFeedPath = "newfeed";

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
}
