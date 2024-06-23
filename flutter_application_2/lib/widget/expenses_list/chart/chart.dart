import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense.dart';
import 'package:flutter_application_2/widget/expenses_list/Chart/Chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.allexpenselist});
  final List<Expense> allexpenselist;
  List<Bucket> get buckets {
    return [
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Food),
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Leisure),
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Travel),
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Work),
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Healthcare),
      Bucket.forcat(allExpenses: allexpenselist, category: Category.Housing)
    ];
  }

  double get max {
    double maximum = 0;
    for (var element in buckets) {
      if (element.total > maximum) {
        maximum = element.total;
      }
    }
    return maximum;
  }

  @override
  Widget build(BuildContext context) {
    final bool isdark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      width: double.infinity,
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(.5),
          Theme.of(context).colorScheme.primary.withOpacity(0)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final element in buckets)
                  ChartBar(
                    fill: element.total == 0 ? 0 : element.total / max,
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(cicons[e.category],
                          color: isdark
                              ? Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(.95)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.6)),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
