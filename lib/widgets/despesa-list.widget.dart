import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/models/despesa.model.dart';
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
    final _controller = Provider.of<DespesaController>(context);

    return Observer(
      builder: (_) {
        return LoadingWidget(
          busy: _controller.busy,
          child: _controller.despesas.length > 0
              ? ListView.builder(
                  itemCount: _controller.despesas.length,
                  itemBuilder: (context, index) {
                    return DespesaItemWidget(
                      despesa: _controller.despesas[index],
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
