import 'game_value.dart';

class Family extends GameValue {
  Family(
    int id, {
    required String title,
    required int price,
    required int outcome,
  }) : super(
          id,
          title: title,
          price: price,
          income: 0,
          outcome: outcome,
        );
}
