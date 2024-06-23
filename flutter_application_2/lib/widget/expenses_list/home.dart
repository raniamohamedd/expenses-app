import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense.dart';
import 'package:flutter_application_2/widget/expenses_list/chart/chart.dart';
import 'package:flutter_application_2/widget/expenses_list/expenses_list.dart';
import 'package:flutter_application_2/widget/expenses_list/new%20expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => Expensee();
}

class Expensee extends State<Expenses> {
  final List<Expense> expenseslist = [
    Expense(
        category: Category.Healthcare,
        title: 'Healthcare',
        amount: 12.3,
        date: DateTime(2024, 6, 22)),
    Expense(
        category: Category.Housing,
        title: 'Housing',
        amount: 45.3,
        date: DateTime(2024, 6, 21)),
    Expense(
        category: Category.Leisure,
        title: 'Leisure',
        amount: 99.0,
        date: DateTime(2024, 6, 19)),
    Expense(
        category: Category.Travel,
        title: 'Travel',
        amount: 53.0,
        date: DateTime(2024, 6, 18)),
    Expense(
        category: Category.Work,
        title: 'Work',
        amount: 63.0,
        date: DateTime(2024, 6, 16)),
    Expense(
        category: Category.Housing,
        title: 'Housing',
        amount: 45.3,
        date: DateTime(2024, 6, 21)),
    Expense(
        category: Category.Food,
        title: 'Food',
        amount: 22.32,
        date: DateTime(2024, 6, 19)),
  ];
  void ADD(Expense expense) {
    setState(() {
      expenseslist.insert(0, expense);
    });
  }

  void remove(Expense expense) {
    setState(() {
      expenseslist.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Expenses Tracker',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 252, 252, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => EXPENSE(
                        onaddex: ADD,
                      ));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
          child: width < 600
              ? Column(
                  children: [
                    Chart(allexpenselist: expenseslist),
                    Expanded(
                      child: Exlist(onremove: remove, exlist: expenseslist),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(allexpenselist: expenseslist)),
                    Expanded(
                      child: Exlist(onremove: remove, exlist: expenseslist),
                    ),
                  ],
                )),
    );
  }
}
