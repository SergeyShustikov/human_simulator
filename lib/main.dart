import 'dart:async';

import 'package:flutter/material.dart';

import 'game/character.dart';
import 'game/database/database.dart';
import 'game/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    lifeEffect.value = jobs().first.lifeEffect?.life ?? 0;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        days.value = t.tick;
        if (lifeEffect.value < 20 && days.value % 60 == 0) {
          lifeEffect.value *= 2;
        }
        if (days.value % 30 == 0) {
          money.value += income.value - outcome.value.abs();
          life.value += lifeEffect.value;
          mood.value += moodEffect.value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Симулятор человека'),
      ),
      body: const MainScreen(),
    );
  }
}
