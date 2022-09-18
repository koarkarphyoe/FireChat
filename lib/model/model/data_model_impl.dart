import 'package:fire_chat/model/custom_object/custom_object.dart';
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

  // RealtimeDatabaseAgent realtimeDatabaseAgent = RealtimeDatabaseAgentImpl();
  RealtimeDatabaseAgent realtimeDatabaseAgent = FirebaseStorageAgentImpl();

  @override
  Stream<List<NewFeedCustomObject>> getNewFeedList() {
    return realtimeDatabaseAgent.getNewFeedList();
  }

  @override
  Future<void> addNewPost(String description) {
    var newId = DateTime.now().millisecondsSinceEpoch;
    var newFeed = NewFeedCustomObject(
        description,
        newId,
        "https://c.wallhere.com/images/aa/aa/89ad15b6d96bc89cef0aaee59a73-1579643.jpg!d",
        "https://c.wallhere.com/images/13/c5/4009382d8def55e9a6874212be0b-1561467.jpg!d",
        "Arkar");

    return realtimeDatabaseAgent.addNewPost(newFeed);
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
}
