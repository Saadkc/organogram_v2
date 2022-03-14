// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organogram_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrganogramStore on OrganogramStoreBase, Store {
  final _$indexViewAtom = Atom(name: 'OrganogramStoreBase.indexView');

  @override
  int get indexView {
    _$indexViewAtom.reportRead();
    return super.indexView;
  }

  @override
  set indexView(int value) {
    _$indexViewAtom.reportWrite(value, super.indexView, () {
      super.indexView = value;
    });
  }

  final _$selectedAtom = Atom(name: 'OrganogramStoreBase.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$maxLevelAtom = Atom(name: 'OrganogramStoreBase.maxLevel');

  @override
  int get maxLevel {
    _$maxLevelAtom.reportRead();
    return super.maxLevel;
  }

  @override
  set maxLevel(int value) {
    _$maxLevelAtom.reportWrite(value, super.maxLevel, () {
      super.maxLevel = value;
    });
  }

  final _$ismenuOpenedAtom = Atom(name: 'OrganogramStoreBase.ismenuOpened');

  @override
  bool get ismenuOpened {
    _$ismenuOpenedAtom.reportRead();
    return super.ismenuOpened;
  }

  @override
  set ismenuOpened(bool value) {
    _$ismenuOpenedAtom.reportWrite(value, super.ismenuOpened, () {
      super.ismenuOpened = value;
    });
  }

  final _$selectedNodeAtom = Atom(name: 'OrganogramStoreBase.selectedNode');

  @override
  OrgNode? get selectedNode {
    _$selectedNodeAtom.reportRead();
    return super.selectedNode;
  }

  @override
  set selectedNode(OrgNode? value) {
    _$selectedNodeAtom.reportWrite(value, super.selectedNode, () {
      super.selectedNode = value;
    });
  }

  final _$controllerAtom = Atom(name: 'OrganogramStoreBase.controller');

  @override
  TreeViewController<OrgNode>? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TreeViewController<OrgNode>? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$rootNodeAtom = Atom(name: 'OrganogramStoreBase.rootNode');

  @override
  OrgNode? get rootNode {
    _$rootNodeAtom.reportRead();
    return super.rootNode;
  }

  @override
  set rootNode(OrgNode? value) {
    _$rootNodeAtom.reportWrite(value, super.rootNode, () {
      super.rootNode = value;
    });
  }

  final _$parseJsonFromAssetsAsyncAction =
      AsyncAction('OrganogramStoreBase.parseJsonFromAssets');

  @override
  Future<OrgNode> parseJsonFromAssets() {
    return _$parseJsonFromAssetsAsyncAction
        .run(() => super.parseJsonFromAssets());
  }

  final _$searchCallBackAsyncAction =
      AsyncAction('OrganogramStoreBase.searchCallBack');

  @override
  Future<dynamic> searchCallBack(BuildContext context) {
    return _$searchCallBackAsyncAction.run(() => super.searchCallBack(context));
  }

  final _$OrganogramStoreBaseActionController =
      ActionController(name: 'OrganogramStoreBase');

  @override
  void setSelectedNode(OrgNode node) {
    final _$actionInfo = _$OrganogramStoreBaseActionController.startAction(
        name: 'OrganogramStoreBase.setSelectedNode');
    try {
      return super.setSelectedNode(node);
    } finally {
      _$OrganogramStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexView(int index) {
    final _$actionInfo = _$OrganogramStoreBaseActionController.startAction(
        name: 'OrganogramStoreBase.setIndexView');
    try {
      return super.setIndexView(index);
    } finally {
      _$OrganogramStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelected(bool value) {
    final _$actionInfo = _$OrganogramStoreBaseActionController.startAction(
        name: 'OrganogramStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$OrganogramStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void expandAllNodes(OrgNode rootOrgNode) {
    final _$actionInfo = _$OrganogramStoreBaseActionController.startAction(
        name: 'OrganogramStoreBase.expandAllNodes');
    try {
      return super.expandAllNodes(rootOrgNode);
    } finally {
      _$OrganogramStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexView: ${indexView},
selected: ${selected},
maxLevel: ${maxLevel},
ismenuOpened: ${ismenuOpened},
selectedNode: ${selectedNode},
controller: ${controller},
rootNode: ${rootNode}
    ''';
  }
}
