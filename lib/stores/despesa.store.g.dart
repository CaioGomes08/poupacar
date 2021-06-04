// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DespesaStore on _DespesaStoreBase, Store {
  final _$currentStateAtom = Atom(name: '_DespesaStoreBase.currentState');

  @override
  String get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(String value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  final _$busyAtom = Atom(name: '_DespesaStoreBase.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  final _$itemsAtom = Atom(name: '_DespesaStoreBase.items');

  @override
  ObservableList<Despesa> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Despesa> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_DespesaStoreBaseActionController =
      ActionController(name: '_DespesaStoreBase');

  @override
  void changeSelected(String state) {
    final _$actionInfo = _$_DespesaStoreBaseActionController.startAction(
        name: '_DespesaStoreBase.changeSelected');
    try {
      return super.changeSelected(state);
    } finally {
      _$_DespesaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDespesas(List<Despesa> despesas) {
    final _$actionInfo = _$_DespesaStoreBaseActionController.startAction(
        name: '_DespesaStoreBase.setDespesas');
    try {
      return super.setDespesas(despesas);
    } finally {
      _$_DespesaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearDespesas() {
    final _$actionInfo = _$_DespesaStoreBaseActionController.startAction(
        name: '_DespesaStoreBase.clearDespesas');
    try {
      return super.clearDespesas();
    } finally {
      _$_DespesaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
busy: ${busy},
items: ${items}
    ''';
  }
}
