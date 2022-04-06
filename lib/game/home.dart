import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'character.dart';
import 'choosing_screen.dart';
import 'database/database.dart';
import 'database/models/game_value.dart';
import 'text_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<String>(
                  builder: (BuildContext context, value, Widget? child) => Text(
                    value,
                    style: style.header20().bold(),
                  ),
                  valueListenable: name,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: ValueListenableBuilder(
                    builder: (BuildContext context, value, Widget? child) => Text(
                      "День\n$value",
                      textAlign: TextAlign.center,
                    ),
                    valueListenable: days,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Table(
              defaultColumnWidth: const FlexColumnWidth(),
              columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth(), 2: IntrinsicColumnWidth()},
              children: [
                TableRow(
                  children: [
                    ValueListenableBuilder<int>(
                      builder: (BuildContext context, value, Widget? child) => Header(title: "Здоровье ($value)", bold: true),
                      valueListenable: life,
                    ),
                    ValueListenableBuilder<int>(
                      builder: (BuildContext context, value, Widget? child) => Header(title: "Настроение ($value)", bold: true),
                      valueListenable: mood,
                    ),
                    const Header(title: "Деньги", bold: true),
                  ],
                ),
                TableRow(children: [
                  Center(
                    child: Container(
                      height: 12,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ValueListenableBuilder<int>(
                        valueListenable: life,
                        builder: (BuildContext context, value, Widget? child) => LinearProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                          value: value / 100,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 12,
                      padding: const EdgeInsets.only(right: 8),
                      child: ValueListenableBuilder<int>(
                        valueListenable: mood,
                        builder: (context, value, child) => LinearProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.amber,
                          ),
                          value: value / 100,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ValueListenableBuilder(
                      builder: (BuildContext context, value, Widget? child) => Text(value.toString()),
                      valueListenable: money,
                    ),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(children: [
              Expanded(
                child: Table(
                  columnWidths: const {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
                  border: TableBorder.all(borderRadius: BorderRadius.circular(8), color: const Color(0xffe6e6e6)),
                  children: [
                    statusRowHeader("Работа :", job),
                    statusRowHeader("Машина :", car),
                    statusRowHeader("Одежда :", cloth),
                    statusRowHeader("Еда :", food),
                    statusRowHeader("Жилье :", house),
                    statusRowHeader("Семья :", family),
                    statusRowHeader("Обучение :", education),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: MediaQuery.of(context).size.width / 3 - 8,
                height: 230,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe6e6e6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Доход",
                          style: style.bold(),
                        ),
                        ValueListenableBuilder(
                          builder: (BuildContext context, value, Widget? child) => Text(
                            value.toString(),
                          ),
                          valueListenable: income,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Text(
                          "Расход",
                          style: style.bold(),
                        ),
                        ValueListenableBuilder(
                          builder: (BuildContext context, value, Widget? child) => Text(
                            value.toString(),
                          ),
                          valueListenable: outcome,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
            const SizedBox(height: 4),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: [
                MenuCard(
                  title: "Работа",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(jobs()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Машина",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(cars()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Одежда",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(clothes()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Еда",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(foods()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Жилье",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(houses()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Семья",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(families()),
                    ));
                  },
                ),
                MenuCard(
                  title: "Обучение",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoosingScreen(educations()),
                    ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow statusRowHeader(String header, ValueListenable<GameValue> listenable) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          header,
          style: style.bold(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<GameValue>(
          builder: (BuildContext context, value, Widget? child) => Text(
            value.title,
            style: style,
          ),
          valueListenable: listenable,
        ),
      ),
    ]);
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MenuCard({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, top: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe6e6e6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        // splashColor: Theme.of(context).primaryColor,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: Center(child: Text(title, style: style.bold())),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final bool bold;
  const Header({
    Key? key,
    required this.title,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: bold ? style.bold() : null,
      ),
    ));
  }
}
