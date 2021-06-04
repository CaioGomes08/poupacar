import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/stores/despesa.store.dart';
import 'package:provider/provider.dart';

import 'despesa-item.widget.dart';
import 'loading.widget.dart';

class DespesaListWidget extends StatefulWidget {
  @override
  _DespesaListWidgetState createState() => _DespesaListWidgetState();
}

class _DespesaListWidgetState extends State<DespesaListWidget> {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<DespesaStore>(context);

    return Observer(
      builder: (_) {
        return LoadingWidget(
          busy: _store.busy,
          child: _store.items.length > 0
              ? ListView.builder(
                  itemCount: _store.items.length,
                  itemBuilder: (context, index) {
                    return DespesaItemWidget(
                      despesa: _store.items[index],
                    );
                  },
                )
              : Center(
                  child: Text('Nenhum lançamento cadastrado!'),
                ),
        );
      },
    );
  }
}
