import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/repositories/despesa.repository.dart';
import 'package:poupacar/stores/despesa.store.dart';

class DespesaController {
  DespesaStore _store;
  DespesaRepository _repository;

  DespesaController(DespesaStore store) {
    _store = store;
    _repository = new DespesaRepository();
  }

  getDespesas(String periodo) async {
    _store.clearDespesas();

    switch (periodo) {
      case 'hoje':
        {
          _store.busy = true;
          _store.changeSelected('hoje');
          _repository.getDespesasHoje().then((value) {
            _store.setDespesas(value);
            _store.busy = false;
          });
          return;
        }
      case 'todos':
        {
          _store.busy = true;
          _store.changeSelected('todos');
          _repository.getTodasDespesas().then((value) {
            _store.setDespesas(value);
            _store.busy = false;
          });
          return;
        }
    }
  }

  deleteDespesa(int id) async {
    return await _repository.deleteDespesa(id);
  }

  Future<bool> insertDespesa(Despesa model) async {
    _store.busy = true;
    return await _repository.create(model).then((_) {
      _store.busy = false;
      return true;
    }).catchError((_) {
      _store.busy = false;
      return false;
    });
  }

  Future<bool> updateDespesa(int id, Despesa model) async {
    _store.busy = true;
    return await _repository.update(id, model).then((_) {
      _store.busy = false;
      return true;
    }).catchError((_) {
      _store.busy = false;
      return false;
    });
  }
}
