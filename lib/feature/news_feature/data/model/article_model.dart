import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArticleModel{
  const ArticleModel({
    this.id = '',
    this.title = '',
    this.publicationDate = '',
    this.imageUrl = '',
    this.readed = false,
    this.description = '',
  });

  final String id;
  final String title;
  final String publicationDate;
  final String imageUrl;
  final bool readed;
  final String description;

  factory ArticleModel.fromJson(Map<String,dynamic> json) => _$ArticleModelFromJson(json);

  Map<String,dynamic> toJson() => _$ArticleModelToJson(this);
}