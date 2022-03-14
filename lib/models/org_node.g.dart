
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgNode _$OrgNodeFromJson(Map<String, dynamic> json) {
  return OrgNode(
    person: Entity.fromJson(json['person'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrgNodeToJson(OrgNode instance) => <String, dynamic>{
      'entity': instance.person,
    };