import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense.dart';

class ExpensesItem extends StatefulWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;

  @override
  State<ExpensesItem> createState() => _ExpensesItemState();
}

class _ExpensesItemState extends State<ExpensesItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.expense.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('\$${widget.expense.amount.toString()}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(cicons[widget.expense.category]),
                    const SizedBox(width: 15),
                    Text(widget.expense.formate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
