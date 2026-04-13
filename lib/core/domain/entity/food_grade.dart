import 'package:flutter/material.dart';

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

  Color get color {
    switch (this) {
      case FoodGrade.a:
        return Colors.green;
      case FoodGrade.b:
        return Colors.lightGreen;
      case FoodGrade.c:
        return Colors.orange;
      case FoodGrade.d:
        return Colors.red;
    }
  }
}
