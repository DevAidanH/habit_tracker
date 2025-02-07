import 'package:flutter/material.dart';
import 'package:habit_tracker/Themes/theme.dart';
import 'package:habit_tracker/data/habit_data.dart';
import 'package:habit_tracker/pages/welcomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => HabitData(), child: MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home: Welcomepage(),
    ));
  }
}