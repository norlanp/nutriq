import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_word_response_dto.dart';

void main() {
  test('rejects a malformed FDC response without foods', () {
    expect(
      () => FDCWordResponseDTO.fromJson(const {}),
      throwsA(anything),
    );
  });
}
