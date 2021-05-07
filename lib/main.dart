import 'package:flutter/material.dart';
import 'package:poupacar/controllers/despesa.controller.dart';
import 'package:poupacar/views/home.view.dart';
import 'package:poupacar/themes/light.theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DespesaController>.value(
          value: DespesaController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: HomePageView(),
      ),
    );
  }
}
