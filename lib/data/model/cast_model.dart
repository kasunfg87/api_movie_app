part of '../../core/entities/objects.dart';

@JsonSerializable(explicitToJson: true)
class CastModel {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'cast_id')
  int? castId;
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  int? order;

  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
