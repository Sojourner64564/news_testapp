// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      publicationDate: json['publication_date'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      readed: json['readed'] as bool? ?? false,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publication_date': instance.publicationDate,
      'image_url': instance.imageUrl,
      'readed': instance.readed,
      'description': instance.description,
    };
