// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_kt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KtNode _$KtNodeFromJson(Map<String, dynamic> json) => KtNode(
      person: Entity.fromJson(json['person'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>)
          .map((e) => KtNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      level: json['level'] as int,
    );

Map<String, dynamic> _$KtNodeToJson(KtNode instance) => <String, dynamic>{
      'person': instance.person.toJson(),
      'level': instance.level,
      'children': instance.children.map((e) => e.toJson()).toList(),
    };
