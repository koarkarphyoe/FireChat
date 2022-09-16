
import '../model/custom_object/custom_object.dart';

abstract class RealtimeDatabaseAgent {
  Stream<List<NewFeedCustomObject>> getNewFeedList();
}
