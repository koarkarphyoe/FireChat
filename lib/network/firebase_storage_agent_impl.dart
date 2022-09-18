import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';

const newFeedPath = "newfeed";

class FirebaseStorageAgentImpl extends RealtimeDatabaseAgent {
  static final FirebaseStorageAgentImpl _singleton =
      FirebaseStorageAgentImpl._internal();
  factory FirebaseStorageAgentImpl() {
    return _singleton;
  }
  FirebaseStorageAgentImpl._internal();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addNewPost(NewFeedCustomObject newFeed) {
    return firebaseFirestore
        .collection(newFeedPath)
        .doc(newFeed.id.toString())
        .set(newFeed.toJson());
  }

  @override
  void deletePost(int postId) {
    firebaseFirestore.collection(newFeedPath).doc(postId.toString()).delete();
  }

  @override
  Future<NewFeedCustomObject> getNewFeedById(int id) {
    return firebaseFirestore
        .collection(newFeedPath)
        .doc(id.toString())
        .get()
        .then((value) {
      return NewFeedCustomObject.fromJson(value.data()!);
    });
  }

  @override
  Stream<List<NewFeedCustomObject>> getNewFeedList() {
    return firebaseFirestore.collection(newFeedPath).snapshots().map((event) {
      return event.docs.map((e) {
        return NewFeedCustomObject.fromJson(e.data());
      }).toList();
    });
  }
}
