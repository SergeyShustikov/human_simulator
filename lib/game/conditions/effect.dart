class Effect {
  final int life;
  final int mood;
  Effect(this.life, this.mood);
}

class BadEffect extends Effect {
  BadEffect({int life = 0, int mood = 0}) : super(-life, -mood);
}

class GoodEffect extends Effect {
  GoodEffect({int life = 0, int mood = 0}) : super(life, mood);
}
