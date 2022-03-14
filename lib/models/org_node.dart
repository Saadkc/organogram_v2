import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';

import 'entity.dart';

part 'org_node.g.dart';

class OrgNode extends ListenableNode<OrgNode> {
  Entity? person;

  OrgNode({
    Key? key,
    this.person,
  });
  factory OrgNode.fromJson(Map<String, dynamic> json) =>
      _$OrgNodeFromJson(json);
  Map<String, dynamic> toJson() => _$OrgNodeToJson(this);
}
