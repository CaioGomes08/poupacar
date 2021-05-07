import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/repositories/despesa.repository.dart';
import 'package:poupacar/views/home.view.dart';
import 'package:provider/provider.dart';

class CreateDespesaView extends StatefulWidget {
  final Despesa despesa;

  CreateDespesaView({this.despesa});

  @override
  _CreateDespesaViewState createState() => _CreateDespesaViewState();
}

class _CreateDespesaViewState extends State<CreateDespesaView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = new DateFormat("dd/MM/yyyy");
  final _repository = new DespesaRepository();

  String valorAbastecido;

  DateTime date = DateTime.now();

  Despesa get despesa => widget.despesa;

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2040),
      confirmText: "Confirmar",
      cancelText: "Cancelar",
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        despesa.data = date.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _despesaController = Provider.of<DespesaController>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:
            despesa.id == null ? Text('Nova Despesa') : Text('Alterar Despesa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: despesa.totalAbastecido != null
                      ? despesa?.totalAbastecido.toString()
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Valor abastecido',
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) =>
                      despesa.totalAbastecido = double.parse(value),
                  validator: (value) {
                    if (value.isEmpty || double.parse(value) <= 0) {
                      return 'Valor inválido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: despesa.totalLitros != null
                      ? despesa.totalLitros.toString()
                      : "",
                  decoration: InputDecoration(
                    labelText: 'Total de Litros',
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) =>
                      despesa.totalLitros = double.parse(value),
                  validator: (value) {
                    if (value.isEmpty || double.parse(value) <= 0) {
                      return 'Valor inválido';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    _dateFormat.format(date),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  child: Text('Alterar data'),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: onSubmit,
                      child: Text('Salvar'),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    if (despesa.id == null || despesa.id == 0) {
      create();
    } else {
      update();
    }
  }

  create() {
    widget.despesa.id = null;
    if (widget.despesa.data == null) {
      widget.despesa.data = date.toString();
    }
    _repository
        .create(widget.despesa)
        .then((_) => onSuccess())
        .catchError((_) => onError());
  }

  update() {}

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePageView(),
      ),
    );
  }

  onError() {
    final snackbar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
