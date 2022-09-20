import 'package:fire_chat/model/custom_object/user_vo.dart';
import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:fire_chat/network/realtime_database_agent_impl.dart';

class AuthenticationModelImpl extends AuthenticationModel {
  RealtimeDatabaseAgent realtimeDatabaseAgent = RealtimeDatabaseAgentImpl();

  @override
  Future registerNewUser(String userName, String userEmail, String password) {
    return craftUserVO(userName, userEmail, password).then((userVO) {
      return realtimeDatabaseAgent.registerNewUser(userVO);
    });
  }

  Future<UserVo> craftUserVO(String userName, String email, String password) {
    var userVO = UserVo(
        id: "", userName: userName, userEmail: email, userPassword: password);
    return Future.value(userVO);
  }
}
