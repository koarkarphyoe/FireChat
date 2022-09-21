import 'package:fire_chat/model/custom_object/user_vo.dart';

abstract class AuthenticationModel {
  Future<void> registerNewUser(
      String userName, String userEmail, String password);
  Future<void> login(String email, String password);
  bool isLoggedIn();
  UserVo getLoggedInUser();
}
