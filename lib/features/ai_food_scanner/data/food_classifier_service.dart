import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';

class FoodClassifierService {
  static const String _modelAssetPath = 'assets/models/food_classifier.tflite';
  static const int _defaultTopK = 5;

  bool _isModelLoaded = false;

  bool get isModelLoaded => _isModelLoaded;

  Future<void> loadModel() async {
    if (kIsWeb) {
      _isModelLoaded = false;
      return;
    }
    try {
      final modelPath = await _getModelFilePath();
      if (modelPath == null) {
        _isModelLoaded = false;
        return;
      }
      // TODO: Initialize tflite_flutter interpreter with modelPath
      _isModelLoaded = true;
    } catch (_) {
      _isModelLoaded = false;
    }
  }

  Future<String?> _getModelFilePath() async {
    if (kIsWeb) return null;
    if (!file_helper.hasFileSupport) return null;
    try {
      final data = await rootBundle.load(_modelAssetPath);
      final bytes = data.buffer.asUint8List();
      return await file_helper.writeTempFile('food_classifier.tflite', bytes);
    } catch (_) {
      return null;
    }
  }

  Future<List<FoodCandidateEntity>> classifyImage(
    String imagePath, {
    int topK = _defaultTopK,
  }) async {
    if (!_isModelLoaded) {
      await loadModel();
      if (!_isModelLoaded) {
        return _placeholderResults(topK);
      }
    }

    try {
      // TODO: Run actual TFLite inference
      return _placeholderResults(topK);
    } catch (_) {
      return _placeholderResults(topK);
    }
  }

  List<FoodCandidateEntity> _placeholderResults(int topK) {
    const placeholderFoods = [
      'Apple',
      'Banana',
      'Rice',
      'Chicken Breast',
      'Salad',
      'Pasta',
      'Bread',
    ];
    return placeholderFoods.take(topK).map((name) {
      final confidence = 0.85 - (placeholderFoods.indexOf(name) * 0.12);
      return FoodCandidateEntity(
        name: name,
        confidence: confidence.clamp(0.1, 1.0),
      );
    }).toList();
  }

  void dispose() {
    _isModelLoaded = false;
  }
}
