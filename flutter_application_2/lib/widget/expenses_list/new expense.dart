import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/model/expense.dart';
import 'package:intl/intl.dart';

class EXPENSE extends StatefulWidget {
  const EXPENSE({super.key, required this.onaddex});
  final void Function(Expense expense) onaddex;
  @override
  State<EXPENSE> createState() => _exState();
}

class _exState extends State<EXPENSE> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _selecteddate;
  Category selectedcategory = Category.Food;
  @override
  void dispose() {
    _title.dispose();
    super.dispose();
    _amount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 50, 18, 10),
          child: Column(
            children: [
              TextField(
                controller: _title,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(
                      color: Color.fromARGB(255, 194, 183, 183),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$',
                      label: Text(
                        'Amount',
                        style: TextStyle(
                            color: Color.fromARGB(255, 193, 189, 189)),
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_selecteddate == null
                      ? 'No Selected Date'
                      : DateFormat.yMd().format(_selecteddate!)),
                  IconButton(
                      onPressed: () async {
                        final DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 30,
                                DateTime.now().month, DateTime.now().day),
                            lastDate: DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day));
                        setState(() {
                          _selecteddate = pickeddate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month)),
                  const SizedBox(width: 20),
                  DropdownButton(
                      value: selectedcategory,
                      items: Category.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(),
                      onChanged: (newcategory) {
                        if (newcategory == null) {
                          return;
                        }
                        setState(() {
                          selectedcategory = newcategory;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final double? enteredamount =
                            double.tryParse(_amount.text);
                        final amountisinvalid =
                            enteredamount == null || enteredamount <= 0;

                        if (_title.text.trim().isEmpty ||
                            amountisinvalid ||
                            _selecteddate == null) {
                          Platform.isIOS
                              ? showCupertinoDialog(
                                  context: context,
                                  builder: (ctx) => CupertinoAlertDialog(
                                        title: const Text('invalid input'),
                                        content: const Text(
                                            'please make sure that all valid data was entered'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx),
                                              child: const Text('okay'))
                                        ],
                                      ))
                              : showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: const Text('invalid input'),
                                        content: const Text(
                                            'please make sure that all valid data was entered'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx),
                                              child: const Text('okay'))
                                        ],
                                      ));
                        } else {
                          widget.onaddex(Expense(
                              title: _title.text,
                              amount: enteredamount,
                              date: _selecteddate!,
                              category: selectedcategory));
                          Navigator.pop(context); //OUT
                        }
                      },
                      child: const Text('save',
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 2, 2)))),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel',
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 2, 2))))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
