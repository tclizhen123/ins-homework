import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  final String content;
  final List<String?> images;
  final num? likeCount;

  HomeModel({required this.content, required this.images, this.likeCount});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
