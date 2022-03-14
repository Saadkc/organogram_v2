import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@JsonSerializable()
class Entity {
  const Entity({
    required this.name,
    required this.designation,
    required this.imageURL,
  });

  final String name;
  final String designation;
  final String imageURL;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}