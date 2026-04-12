import 'package:image_picker/image_picker.dart';
import 'package:nutriq/features/ai_food_scanner/data/food_classifier_service.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';

class ClassifyFoodUsecase {
  final FoodClassifierService _classifierService;

  ClassifyFoodUsecase(this._classifierService);

  Future<List<FoodCandidateEntity>> captureAndClassify() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 640,
      maxHeight: 640,
      imageQuality: 85,
    );

    if (xFile == null) return [];

    return await _classifierService.classifyImage(xFile.path);
  }

  Future<List<FoodCandidateEntity>> classifyFromGallery() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 640,
      maxHeight: 640,
      imageQuality: 85,
    );

    if (xFile == null) return [];

    return await _classifierService.classifyImage(xFile.path);
  }
}
