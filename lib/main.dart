import 'package:expenses/models/transaction.dart';
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
  // const MyHomePage({super.key});

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Iphone 15',
      value: 310.78,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Notebook',
      value: 5000.00,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Despesas Pessoais"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tr.value.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(tr.title),
                          Text(tr.date.toString()),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
