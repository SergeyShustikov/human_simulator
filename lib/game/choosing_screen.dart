import 'package:flutter/material.dart';
import 'package:human_simulator/game/character.dart';
import 'package:human_simulator/game/database/database.dart';
import 'package:human_simulator/game/text_utils.dart';

import 'database/models/education.dart';
import 'database/models/game_value.dart';

class ChoosingScreen<T extends GameValue> extends StatefulWidget {
  final List<T> values;
  const ChoosingScreen(this.values, {Key? key}) : super(key: key);

  @override
  State<ChoosingScreen<T>> createState() => _ChoosingScreenState<T>();
}

class _ChoosingScreenState<T extends GameValue> extends State<ChoosingScreen<T>> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ...widget.values.where((element) => element != widget.values.first).map(
            (e) {
              var isMatched = isRequirenmentsMatched(e.requirenments);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.title,
                      style: style.copyWith(color: isMatched ? null : Colors.grey),
                    ),
                    if (e.income != 0)
                      Text(
                        "${e.income}\$ в месяц",
                        style: style.copyWith(color: Colors.green),
                      ),
                    if (e.outcome != 0)
                      Text(
                        "${e.outcome}\$ в месяц",
                        style: style.copyWith(color: Colors.red),
                      )
                  ],
                ),
                subtitle: e.runtimeType == Education
                    ? Text(
                        "${(e as Education).month} месяцев",
                        style: style.copyWith(color: Colors.red),
                      )
                    : null,
                onTap: () async {
                  if (!isMatched) {
                    /// Means that some expressions are not matched
                    await showDialog(context: context, builder: (context) => UnmatchedRequirenments(context, e.requirenments));
                    setState(() {});
                  } else {
                    var notifier = getNotifierById(e.id);
                    var enoughMoney = money.value >= e.price;
                    // var enoughMood = hasMoodRequirenment(e.requirenments) ? mood.value >= 80 : false;
                    // if (!enoughMood) {
                    //   showDialog(context: context, builder: builder)
                    //   return;
                    // }

                    if (enoughMoney) {
                      if (notifier.value is GameValue && notifier.value.id != e.id) {
                        notifier.value = e;
                        money.value -= e.outcome;
                        income.value += e.income;
                        outcome.value -= e.outcome;
                        lifeEffect.value += e.lifeEffect?.life ?? 0;
                      }
                    }
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class UnmatchedRequirenments extends StatefulWidget {
  final List<int> requirenments;

  const UnmatchedRequirenments(BuildContext context, this.requirenments, {Key? key}) : super(key: key);

  @override
  State<UnmatchedRequirenments> createState() => _UnmatchedRequirenmentsState();
}

class _UnmatchedRequirenmentsState extends State<UnmatchedRequirenments> {
  late List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    widgets = widget.requirenments.map<Widget>((e) {
      var value = findValueById(e);
      return ListTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(border: Border.all()),
          child: isIdMatched(e)
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 22,
                )
              : null,
        ),
        title: Text(value.title),
        onTap: () async {
          var collection = getCollectionByType(value.runtimeType);
          await Navigator.of(context)
              // ..popUntil((route) => route.isFirst)
              .push(MaterialPageRoute(builder: (BuildContext context) => ChoosingScreen(collection)));
          setState(() {});
        },
      );
    }).toList()
      ..add(ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Понятно"),
        style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 44)),
      ));
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(12),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ListView(
          shrinkWrap: true,
          children: widgets,
        ),
      ),
    );
  }
}
