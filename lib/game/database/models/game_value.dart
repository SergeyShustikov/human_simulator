import '../../conditions/effect.dart';

class GameValue {
  final int id;

  /// The title of game value
  final String title;

  /// How value affects outcome immediately.
  final int price;

  /// How value affects income montly.
  final int income;

  /// How value affets outcome montly.
  final int outcome;

  final List<int> requirenments;

  Effect? lifeEffect;

  GameValue(
    this.id, {
    required this.title,
    required this.price,
    required this.income,
    required this.outcome,
    this.requirenments = const [],
    this.lifeEffect,
  });
}
