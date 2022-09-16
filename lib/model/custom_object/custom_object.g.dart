// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewFeedCustomObject _$NewFeedCustomObjectFromJson(Map<String, dynamic> json) =>
    NewFeedCustomObject(
      json['description'] as String?,
      json['id'] as int?,
      json['post_image'] as String?,
      json['profile_picture'] as String?,
      json['user_name'] as String?,
    );

Map<String, dynamic> _$NewFeedCustomObjectToJson(
        NewFeedCustomObject instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'post_image': instance.postImage,
      'profile_picture': instance.profilePicture,
      'user_name': instance.userName,
    };
