// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DespesaController on _DespesaController, Store {
  final _$currentStateAtom = Atom(name: '_DespesaController.currentState');

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

  final _$busyAtom = Atom(name: '_DespesaController.busy');

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

  final _$despesasAtom = Atom(name: '_DespesaController.despesas');

  @override
  ObservableList<Despesa> get despesas {
    _$despesasAtom.reportRead();
    return super.despesas;
  }

  @override
  set despesas(ObservableList<Despesa> value) {
    _$despesasAtom.reportWrite(value, super.despesas, () {
      super.despesas = value;
    });
  }

  final _$getDespesasAsyncAction =
      AsyncAction('_DespesaController.getDespesas');

  @override
  Future getDespesas(String periodo) {
    return _$getDespesasAsyncAction.run(() => super.getDespesas(periodo));
  }

  final _$_DespesaControllerActionController =
      ActionController(name: '_DespesaController');

  @override
  void changeSelected(String state) {
    final _$actionInfo = _$_DespesaControllerActionController.startAction(
        name: '_DespesaController.changeSelected');
    try {
      return super.changeSelected(state);
    } finally {
      _$_DespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDespesas(List<Despesa> despesas) {
    final _$actionInfo = _$_DespesaControllerActionController.startAction(
        name: '_DespesaController.setDespesas');
    try {
      return super.setDespesas(despesas);
    } finally {
      _$_DespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearDespesas() {
    final _$actionInfo = _$_DespesaControllerActionController.startAction(
        name: '_DespesaController.clearDespesas');
    try {
      return super.clearDespesas();
    } finally {
      _$_DespesaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
busy: ${busy},
despesas: ${despesas}
    ''';
  }
}
