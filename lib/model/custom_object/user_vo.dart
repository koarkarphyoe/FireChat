import 'package:json_annotation/json_annotation.dart';
part 'user_vo.g.dart';


@JsonSerializable()
class UserVo {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "user_name")
  String? userName;

  @JsonKey(name: "user_email")
  String? userEmail;

  @JsonKey(name: "user_password")
  String? userPassword;

  UserVo({this.id, this.userName, this.userEmail, this.userPassword});

  factory UserVo.fromJson(Map<String, dynamic> json) => _$UserVoFromJson(json);
  Map<String, dynamic> toJson() => _$UserVoToJson(this);
}
