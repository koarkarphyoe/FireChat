import 'package:json_annotation/json_annotation.dart';
part 'custom_object.g.dart';

@JsonSerializable()
class NewFeedCustomObject {
  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "post_image")
  String? postImage;

  @JsonKey(name: "profile_picture")
  String? profilePicture;

  @JsonKey(name: "user_name")
  String? userName;

  NewFeedCustomObject(
      this.description,
      this.id,
      this.postImage,
      this.profilePicture,
      this.userName);

  factory NewFeedCustomObject.fromJson(Map<String, dynamic> json) =>
      _$NewFeedCustomObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NewFeedCustomObjectToJson(this);
}
