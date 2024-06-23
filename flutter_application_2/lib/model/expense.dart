import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateformat = DateFormat.yMd();

enum Category { Food, Travel, Work, Leisure, Housing, Healthcare }

const cicons = {
  Category.Food: Icons.lunch_dining,
  Category.Travel: Icons.flight_takeoff,
  Category.Work: Icons.work,
  Category.Leisure: Icons.movie,
  Category.Housing: Icons.house_rounded,
  Category.Healthcare: Icons.medical_information_rounded,
};

class Expense {
  final String id;
  final Category category;
  final String title;
  final double amount;
  final DateTime date;
  String get formate {
    return dateformat.format(date);
  }

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v6();
}

class Bucket {
  final Category category;
  final List<Expense> Expenses;

  Bucket({required this.category, required this.Expenses});
  Bucket.forcat({required this.category, required List<Expense> allExpenses})
      : Expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get total {
    double sum = 0;
    for (var exp in Expenses) {
      sum = sum + exp.amount;
    }
    return sum;
  }
}
