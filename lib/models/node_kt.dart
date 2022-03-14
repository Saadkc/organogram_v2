import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'node_kt.g.dart';

@JsonSerializable(explicitToJson: true)
class KtNode {
  final Entity person;
  final int level;
  final List<KtNode> children;

  KtNode({
    required this.person,
    required this.children,
    required this.level,
  });

  factory KtNode.fromJson(Map<String, dynamic> json) => _$KtNodeFromJson(json);
  Map<String, dynamic> toJson() => _$KtNodeToJson(this);
}
