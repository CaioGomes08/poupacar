import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/stores/despesa.store.dart';
import 'package:provider/provider.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<DespesaStore>(context);
    final _controller = new DespesaController(_store);

    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Observer(builder: (_) {
            return TextButton(
              child: Text(
                'Todos',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: _store.currentState == 'todos'
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                _controller.getDespesas('todos');
              },
            );
          }),
          Observer(builder: (_) {
            return TextButton(
              child: Text(
                'Hoje',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: _store.currentState == 'hoje'
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                _controller.getDespesas('hoje');
              },
            );
          }),
          TextButton(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w100,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
