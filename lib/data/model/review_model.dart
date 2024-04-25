part of '../../core/entities/objects.dart';

@JsonSerializable(explicitToJson: true)
class ReviewModel {
  String? author;
  @JsonKey(name: 'author_details')
  AuthorModel? authorDetails;
  String? content;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? id;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  String? url;

  ReviewModel(
      {this.author,
      this.authorDetails,
      this.content,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.url});

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
