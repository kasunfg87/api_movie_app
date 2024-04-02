part of '../../core/entities/objects.dart';

@JsonSerializable(explicitToJson: true)
class BiographyModel {
  bool? adult;
  @JsonKey(name: 'also_known_as')
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  int? gender;
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  String? name;
  @JsonKey(name: 'place_of_birth')
  String? placeOfBirth;
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;

  BiographyModel(
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.gender,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath});

  factory BiographyModel.fromJson(Map<String, dynamic> json) =>
      _$BiographyModelFromJson(json);

  Map<String, dynamic> toJson() => _$BiographyModelToJson(this);
}
