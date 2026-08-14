import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:nutriq/features/ai_food_scanner/data/food_classifier_service.dart';

void main() {
  test('parses Food V1 labels in their output-tensor order', () {
    final labels = FoodClassifierService.parseFoodV1LabelMap('''
id,name
0,__background__
1,Chaudin
2,"Pasta, baked"
''');

    expect(labels, ['__background__', 'Chaudin', 'Pasta, baked']);
  });

  test('rejects a label map with missing output indexes', () {
    expect(
      () => FoodClassifierService.parseFoodV1LabelMap('''
id,name
0,__background__
2,Chaudin
'''),
      throwsA(isA<FormatException>()),
    );
  });

  testWidgets('bundles the complete Food V1 label map', (tester) async {
    final labelMap = await rootBundle.loadString(
      'assets/models/food_v1_labelmap.csv',
    );

    expect(
      FoodClassifierService.parseFoodV1LabelMap(labelMap),
      hasLength(2024),
    );
  });

}
