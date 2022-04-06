import 'package:flutter/foundation.dart';

import 'database/database.dart';
import 'database/models/cars.dart';
import 'database/models/cloth.dart';
import 'database/models/education.dart';
import 'database/models/family.dart';
import 'database/models/food.dart';
import 'database/models/game_value.dart';
import 'database/models/house.dart';
import 'database/models/job.dart';

ValueNotifier<String> name = ValueNotifier("Кацап");
ValueNotifier<int> days = ValueNotifier(0);
ValueNotifier<int> life = ValueNotifier(99);
ValueNotifier<int> lifeEffect = ValueNotifier(-10);

ValueNotifier<int> mood = ValueNotifier(99);
ValueNotifier<int> moodEffect = ValueNotifier(-1);

ValueNotifier<int> money = ValueNotifier(300);
ValueNotifier<int> income = ValueNotifier(0);
ValueNotifier<int> outcome = ValueNotifier(0);

ValueNotifier<Car> car = ValueNotifier(cars().first);
ValueNotifier<Cloth> cloth = ValueNotifier(clothes().first);
ValueNotifier<Education> education = ValueNotifier(educations().first);
ValueNotifier<Family> family = ValueNotifier(families().first);

ValueNotifier<Food> food = ValueNotifier(foods().first);
ValueNotifier<House> house = ValueNotifier(houses().first);
ValueNotifier<Job> job = ValueNotifier(jobs().first);

List<GameValue> toGameValues(List<int> requirenments) {
  return requirenments.map((e) => findValueById(e)).toList();
}

bool isRequirenmentsMatched(List<int> requirenments) {
  var fold = requirenments.fold<int>(0, (previousValue, e) {
    return isIdMatched(e) ? previousValue + 1 : previousValue - 1;
  });
  return fold == requirenments.length;
}

bool isIdMatched(int id) {
  var value = findValueById(id);
  var notifier = getNotifierById(id);
  if (notifier.value is GameValue) {
    return (notifier.value as GameValue).id >= value.id;
  } else {
    return notifier.value >= value.id;
  }
}

ValueNotifier getNotifierById(int id) {
  switch (id ~/ 1000) {
    case moodIndex:
      return mood;
    case moneyIndex:
      return money;
    case incomeIndex:
      return income;
    case carIndex:
      return car;
    case clothIndex:
      return cloth;
    case educationIndex:
      return education;
    case familyIndex:
      return family;
    case foodIndex:
      return food;
    case houseIndex:
      return house;
    case jobIndex:
      return job;
    default:
      throw Exception("Undefined notifier for id = $id");
  }
}

bool hasMoodRequirenment(List<int> requirenments) => requirenments.contains(1);
