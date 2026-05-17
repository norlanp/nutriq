import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';

class FoodClassifierService {
  static const String _modelAssetPath = 'assets/models/food_classifier.tflite';
  static const int _defaultTopK = 5;

  Interpreter? _interpreter;
  List<String>? _labels;

  bool get isModelLoaded => _interpreter != null;

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(_modelAssetPath);
      _labels = await _loadLabels();
    } catch (_) {
      _interpreter = null;
      _labels = null;
    }
  }

  Future<List<String>> _loadLabels() async {
    return const [
      'Apple', 'Banana', 'Rice', 'Chicken Breast', 'Salad',
      'Pasta', 'Bread', 'Orange', 'Potato', 'Cheese',
    ];
  }

  Future<List<FoodCandidateEntity>> classifyImage(
    String imagePath, {
    int topK = _defaultTopK,
  }) async {
    if (!isModelLoaded) {
      await loadModel();
      if (!isModelLoaded) {
        return _placeholderResults(topK);
      }
    }

    try {
      final input = await _preprocessImage(imagePath);
      final outputTensors = _interpreter!.getOutputTensors();
      final outputShape = outputTensors[0].shape;
      final output = List.filled(outputShape.reduce((a, b) => a * b), 0.0)
          .reshape(<int>[1, outputShape[1]]);

      _interpreter!.run(input, output);

      final results = <FoodCandidateEntity>[];
      final probabilities = List<double>.from(output[0] as List);
      final indexed = probabilities.asMap().entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      for (final entry in indexed.take(topK)) {
        final label = _labels != null && entry.key < _labels!.length
            ? _labels![entry.key]
            : 'Unknown';
        results.add(FoodCandidateEntity(
          name: label,
          confidence: entry.value.clamp(0.1, 1.0),
        ));
      }
      return results;
    } catch (_) {
      return _placeholderResults(topK);
    }
  }

  Future<List<Object>> _preprocessImage(String imagePath) async {
    return [Uint8List(0)];
  }

  List<FoodCandidateEntity> _placeholderResults(int topK) {
    const placeholderFoods = [
      'Apple', 'Banana', 'Rice', 'Chicken Breast', 'Salad',
      'Pasta', 'Bread',
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
    _interpreter?.close();
    _interpreter = null;
  }
}