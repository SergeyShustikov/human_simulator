import 'game_value.dart';

class Job extends GameValue {
  Job(
    int id, {
    required String title,
    required int income,
    List<int>? requirenments,
  }) : super(
          id,
          title: title,
          price: 0,
          income: income,
          outcome: 0,
          requirenments: requirenments ?? [],
        );
}
