import 'package:flutter/material.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/models/despesa.model.dart';
import 'package:poupacar/views/create-despesa.view.dart';
import 'package:poupacar/widgets/despesa-list.widget.dart';
import 'package:poupacar/widgets/navbar.widget.dart';
import 'package:poupacar/widgets/user-card.widget.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DespesaController>(context);

    if (_controller.currentState == 'none' ||
        _controller.currentState == 'hoje') {
      _controller.getDespesas('hoje');
    }

    return Scaffold(
      body: Column(
        children: [
          UserCard(),
          SizedBox(height: 10),
          NavbarWidget(),
          Expanded(
            child: DespesaListWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDespesaView(
                despesa: new Despesa(),
              ),
            ),
          );
        },
      ),
    );
  }
}
