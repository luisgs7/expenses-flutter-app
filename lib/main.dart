import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Despesas Pessoais"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  "Gráfico",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                elevation: 5,
              ),
            ),
            Card(
              child: Text(
                'Lista de Transações.',
              ),
            )
          ],
        ));
  }
}
