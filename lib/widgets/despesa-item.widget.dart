import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/views/create-despesa.view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DespesaItemWidget extends StatelessWidget {
  Despesa despesa;
  DespesaItemWidget({@required this.despesa});

  final _dateFormat = new DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DespesaController>(context);
    return Dismissible(
      background: Container(
        color: Colors.red.withOpacity(0.4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_forever,
                size: 25,
              ),
            ],
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          print(despesa.id);
          _controller.deleteDespesa(despesa.id);
        }
      },
      key: Key(null),
      child: ListTile(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDespesaView(
                despesa: despesa,
              ),
            ),
          );
        },
        leading: Image.asset(
          'assets/images/petrol.png',
          width: 60,
        ),
        title: Text(
          'Registro de abastecimento',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).accentColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text('Lts: ${despesa.totalLitros}'),
                SizedBox(width: 15),
                Text('Valor: R\$ ${despesa.totalAbastecido}')
              ],
            ),
            Text('Data: ${_dateFormat.format(DateTime.parse(despesa.data))}'),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
