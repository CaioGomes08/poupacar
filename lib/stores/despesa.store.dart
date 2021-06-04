import 'package:mobx/mobx.dart';
import 'package:poupacar/models/despesa.model.dart';

part 'despesa.store.g.dart';

class DespesaStore = _DespesaStoreBase with _$DespesaStore;

abstract class _DespesaStoreBase with Store {
  @observable
  String currentState = "none";

  @observable
  bool busy = false;

  @observable
  ObservableList<Despesa> items = new ObservableList<Despesa>();

  @action
  void changeSelected(String state) {
    currentState = state;
  }

  @action
  void setDespesas(List<Despesa> despesas) {
    items.addAll(despesas);
  }

  @action
  void clearDespesas() {
    items = new ObservableList<Despesa>();
  }
}
