import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction>? transactions;
  void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions!.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      child: Text(
                        'Nenhuma Transação Cadatrastrada!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions?.length,
              itemBuilder: (context, index) {
                final tr = transactions?[index];
                return Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          'R\$${tr?.value}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr!.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 450
                    ? TextButton.icon(
                        onPressed: () => onRemove(tr.id),
                        icon: Icon(Icons.delete),
                        label: Text('Excluir'),
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                        onPressed: () => onRemove(tr.id),
                  ),
                ));
              },
            ),
    );
  }
}
