import 'package:mobx/mobx.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/repositories/despesa.repository.dart';

part 'despesa.controller.g.dart';

class DespesaController = _DespesaController with _$DespesaController;

abstract class _DespesaController with Store {
  @observable
  String currentState = "none";

  @observable
  bool busy = false;

  @observable
  ObservableList<Despesa> despesas = new ObservableList<Despesa>();

  @action
  void changeSelected(String state) {
    currentState = state;
  }

  @action
  getDespesas(String periodo) async {
    final repository = new DespesaRepository();
    busy = true;

    clearDespesas();

    switch (periodo) {
      case 'hoje':
        {
          changeSelected('hoje');
          await repository.getDespesasHoje().then((value) {
            despesas.addAll(value);
            busy = false;
          });
        }
        break;
      case 'todos':
        {
          changeSelected('todos');
          await repository.getTodasDespesas().then((value) {
            despesas.addAll(value);
            busy = false;
          });
        }
        break;
    }
  }

  @action
  void setDespesas(List<Despesa> despesas) {
    despesas.addAll(despesas);
  }

  @action
  void clearDespesas() {
    despesas = new ObservableList<Despesa>();
  }

  @action
  deleteDespesa(int id) async {
    final repository = new DespesaRepository();

    await repository.deleteDespesa(id);
  }
}
