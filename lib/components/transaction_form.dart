import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // const TransactionForm({super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm(),
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      Colors.purple,
                    ),
                  ),
                  child: const Text(
                    'Nova Transação',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
