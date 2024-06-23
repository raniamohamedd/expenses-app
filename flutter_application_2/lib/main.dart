import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/expenses_list/home.dart';

void main() {
  runApp(const MyApp());
}

var mycolor =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(133, 142, 112, 239));

var mydarkcolor =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(133, 81, 38, 224));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        colorScheme: mycolor,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: mycolor.onPrimaryContainer.withOpacity(.9),
            foregroundColor: mycolor.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: mycolor.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: mycolor.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: mycolor.onSecondaryContainer,
                  fontSize: 17),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: mydarkcolor,
        bottomSheetTheme: const BottomSheetThemeData()
            .copyWith(backgroundColor: mydarkcolor.onSecondaryContainer),
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: mydarkcolor.primary,
            foregroundColor: mydarkcolor.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: mydarkcolor.primary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: mydarkcolor.primaryContainer,
              foregroundColor: mydarkcolor.secondary),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: mydarkcolor.onSecondary,
                  fontSize: 16),
            ),
      ),
      home: const Expenses(),
    );
  }
}
