enum FoodGrade {
  a,
  b,
  c,
  d;

  String get label {
    switch (this) {
      case FoodGrade.a:
        return 'A';
      case FoodGrade.b:
        return 'B';
      case FoodGrade.c:
        return 'C';
      case FoodGrade.d:
        return 'D';
    }
  }
}
