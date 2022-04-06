import 'game_value.dart';

class Education extends GameValue {
  final int month;

  Education(
    int id, {
    required String title,
    required this.month,
    required int outcome,
  }) : super(
          id,
          title: title,
          price: 0,
          income: 0,
          outcome: outcome,
        );
}
