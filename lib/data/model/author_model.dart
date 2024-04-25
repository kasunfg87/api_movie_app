part of '../../core/entities/objects.dart';

@JsonSerializable(explicitToJson: true)
class AuthorModel {
  String? name;
  String? username;
  @JsonKey(name: 'avatar_path')
  String? avatarPath;
  double? rating;

  AuthorModel({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
