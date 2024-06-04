// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      content: json['content'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String?).toList(),
      likeCount: json['likeCount'] as num?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'content': instance.content,
      'images': instance.images,
      'likeCount': instance.likeCount,
    };
