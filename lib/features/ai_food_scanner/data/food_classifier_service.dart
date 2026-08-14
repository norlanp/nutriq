import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';

class FoodClassifierService {
  static const String _modelAssetPath = 'assets/models/food_classifier.tflite';
  static const String _labelAssetPath = 'assets/models/food_v1_labelmap.csv';
  static const int _defaultTopK = 5;
  static const int _inputSize = 224;
  static const int _classCount = 2024;

  Interpreter? _interpreter;
  List<String>? _labels;

  bool get isModelLoaded => _interpreter != null;

  Future<void> loadModel() async {
    final interpreter = await Interpreter.fromAsset(_modelAssetPath);
    try {
      final labels = await _loadLabels();
      _validateModelContract(interpreter, labels);
      _interpreter?.close();
      _interpreter = interpreter;
      _labels = labels;
    } catch (error) {
      interpreter.close();
      throw StateError('Food classifier model is unavailable: $error');
    }
  }

  Future<List<String>> _loadLabels() async {
    final labelMap = await rootBundle.loadString(_labelAssetPath);
    return parseFoodV1LabelMap(labelMap);
  }

  Future<List<FoodCandidateEntity>> classifyImage(
    String imagePath, {
    int topK = _defaultTopK,
  }) async {
    if (topK <= 0) {
      throw ArgumentError.value(topK, 'topK', 'must be greater than zero');
    }
    if (!isModelLoaded) {
      await loadModel();
    }

    try {
      final input = await _preprocessImage(imagePath);
      final output = <List<double>>[List.filled(_classCount, 0.0)];

      _interpreter!.run(input, output);

      final results = <FoodCandidateEntity>[];
      final probabilities = output.single;
      final indexed = probabilities.asMap().entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      for (final entry in indexed.take(topK)) {
        results.add(
          FoodCandidateEntity(
            name: _labels![entry.key],
            confidence: entry.value,
          ),
        );
      }
      return results;
    } catch (error) {
      throw StateError('Food classification failed: $error');
    }
  }

  Future<List<List<List<List<double>>>>> _preprocessImage(
    String imagePath,
  ) async {
    final encodedImage = await File(imagePath).readAsBytes();
    final decodedImage = image.decodeImage(encodedImage);
    if (decodedImage == null) {
      throw StateError('Image preprocessing failed: unsupported image format');
    }
    final resizedImage = image.copyResize(
      decodedImage,
      width: _inputSize,
      height: _inputSize,
      interpolation: image.Interpolation.cubic,
    );

    return [
      List.generate(_inputSize, (y) {
        return List.generate(_inputSize, (x) {
          final pixel = resizedImage.getPixel(x, y);
          return [
            pixel.r.toDouble() / 255.0,
            pixel.g.toDouble() / 255.0,
            pixel.b.toDouble() / 255.0,
          ];
        });
      }),
    ];
  }

  static List<String> parseFoodV1LabelMap(String labelMap) {
    final rows = labelMap
        .split(RegExp(r'\r?\n'))
        .where((row) => row.isNotEmpty)
        .toList(growable: false);
    if (rows.isEmpty || rows.first != 'id,name') {
      throw const FormatException('Food V1 label map header is invalid');
    }

    final labels = <String>[];
    for (final row in rows.skip(1)) {
      final match = RegExp(r'^(\d+),(.*)$').firstMatch(row);
      if (match == null || int.parse(match.group(1)!) != labels.length) {
        throw FormatException('Food V1 label map row is invalid: $row');
      }
      labels.add(_parseCsvLabel(match.group(2)!));
    }
    return labels;
  }

  static String _parseCsvLabel(String value) {
    if (!value.startsWith('"')) return value;
    if (!value.endsWith('"')) {
      throw FormatException('Food V1 label is not terminated: $value');
    }
    return value.substring(1, value.length - 1).replaceAll('""', '"');
  }

  static void _validateModelContract(
    Interpreter interpreter,
    List<String> labels,
  ) {
    final inputs = interpreter.getInputTensors();
    final outputs = interpreter.getOutputTensors();
    if (labels.length != _classCount ||
        inputs.length != 1 ||
        outputs.length != 1 ||
        inputs.single.type != TensorType.float32 ||
        outputs.single.type != TensorType.float32 ||
        !_hasShape(inputs.single.shape, const [1, _inputSize, _inputSize, 3]) ||
        !_hasShape(outputs.single.shape, const [1, _classCount])) {
      throw StateError('Food V1 model tensor contract is invalid');
    }
  }

  static bool _hasShape(List<int> actual, List<int> expected) {
    if (actual.length != expected.length) return false;
    for (var index = 0; index < expected.length; index++) {
      if (actual[index] != expected[index]) return false;
    }
    return true;
  }

  void dispose() {
    _interpreter?.close();
    _interpreter = null;
  }
}
