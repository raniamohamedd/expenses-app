import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense.dart';
import 'package:flutter_application_2/widget/expenses_list/expenses_item.dart';

class Exlist extends StatelessWidget {
  const Exlist({
    super.key,
    required this.exlist,
    required this.onremove,
  });

  final List<Expense> exlist;
  final void Function(Expense expense) onremove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    

      itemCount: exlist.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(.8),
            margin: const EdgeInsets.symmetric(vertical: 10)),
        key: ValueKey(exlist[index]),
        onDismissed: (direction) => onremove(exlist[index]),
        child: ExpensesItem(
          expense: exlist[index],
        ),
      ),
    );
  }
}
