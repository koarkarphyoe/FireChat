import 'package:fire_chat/model/custom_object/custom_object.dart';

abstract class DataModel {
  Stream<List<NewFeedCustomObject>> getNewFeedList();
}
