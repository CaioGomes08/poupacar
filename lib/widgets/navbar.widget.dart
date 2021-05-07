import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:provider/provider.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final despesaController = Provider.of<DespesaController>(context);

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
                  fontWeight: despesaController.currentState == 'todos'
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                despesaController.getDespesas('todos');
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
                  fontWeight: despesaController.currentState == 'hoje'
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                despesaController.getDespesas('hoje');
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
