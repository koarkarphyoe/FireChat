import 'package:fire_chat/model/custom_object/custom_object.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:fire_chat/network/realtime_database_agent_impl.dart';

import 'data_model.dart';

class DataModelImpl extends DataModel {
  
  static final DataModelImpl _singleton = DataModelImpl._internal();
  factory DataModelImpl() {
    return _singleton;
  }
  DataModelImpl._internal();


  RealtimeDatabaseAgent realtimeDatabaseAgent = RealtimeDatabaseAgentImpl();

  @override
  Stream<List<NewFeedCustomObject>> getNewFeedList() {
    return realtimeDatabaseAgent.getNewFeedList();
  }
}
