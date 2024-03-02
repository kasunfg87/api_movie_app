part of '../../core/entities/objects.dart';

@JsonSerializable(explicitToJson: true)
class GenreModel {
  int? id;
  String? name;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
