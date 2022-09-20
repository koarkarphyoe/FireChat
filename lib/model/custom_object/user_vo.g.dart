// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
      id: json['id'] as String?,
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      userPassword: json['user_password'] as String?,
    );

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_password': instance.userPassword,
    };
