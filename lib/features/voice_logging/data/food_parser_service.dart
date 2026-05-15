import 'package:logging/logging.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';

class FoodParserService {
  final ProductsRepository _productsRepository;
  final _log = Logger('FoodParserService');

  static final _quantityPattern = RegExp(
    r'(?:(?:a|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|'
    r'half|quarter|dozen|\d+(?:\.\d+)?)\s*)?'
    r'(?:cup|cups|tablespoon|tablespoons|tbsp|teaspoon|teaspoons|tsp|'
    r'ounce|ounces|oz|pound|pounds|lb|lbs|gram|grams|g|kg|'
    r'milliliter|milliliters|ml|liter|liters|l|'
    r'slice|slices|piece|pieces|serving|servings|bowl|bowls|'
    r'can|cans|bottle|bottles|glass|glasses|plate|plates|'
    r'handful|pinch|dash|stick|sticks|large|small|medium)?',
    caseSensitive: false,
  );

  static final _wordNumbers = <String, double>{
    'a': 1,
    'an': 1,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'half': 0.5,
    'quarter': 0.25,
    'dozen': 12,
  };

  static final _unitMap = <String, String>{
    'cup': 'cup',
    'cups': 'cup',
    'tablespoon': 'tbsp',
    'tablespoons': 'tbsp',
    'tbsp': 'tbsp',
    'teaspoon': 'tsp',
    'teaspoons': 'tsp',
    'tsp': 'tsp',
    'ounce': 'oz',
    'ounces': 'oz',
    'oz': 'oz',
    'pound': 'lb',
    'pounds': 'lb',
    'lb': 'lb',
    'lbs': 'lb',
    'gram': 'g',
    'grams': 'g',
    'g': 'g',
    'kg': 'kg',
    'milliliter': 'ml',
    'milliliters': 'ml',
    'ml': 'ml',
    'liter': 'l',
    'liters': 'l',
    'l': 'l',
    'slice': 'slice',
    'slices': 'slice',
    'piece': 'piece',
    'pieces': 'piece',
    'serving': 'serving',
    'servings': 'serving',
    'bowl': 'bowl',
    'bowls': 'bowl',
    'can': 'can',
    'cans': 'can',
    'bottle': 'bottle',
    'bottles': 'bottle',
    'glass': 'glass',
    'glasses': 'glass',
    'plate': 'plate',
    'plates': 'plate',
    'handful': 'handful',
    'pinch': 'pinch',
    'dash': 'dash',
    'stick': 'stick',
    'sticks': 'stick',
  };

  static final _separators = RegExp(r'\band\b|,', caseSensitive: false);

  FoodParserService(this._productsRepository);

  List<VoiceFoodEntryEntity> parseTranscription(String transcription) {
    final trimmed = transcription.trim();
    if (trimmed.isEmpty) return [];

    final segments = trimmed
        .split(_separators)
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final entries = <VoiceFoodEntryEntity>[];
    for (final segment in segments) {
      final entry = _parseSegment(segment);
      if (entry != null) {
        entries.add(entry);
      }
    }

    return entries;
  }

  VoiceFoodEntryEntity? _parseSegment(String segment) {
    final match = _quantityPattern.firstMatch(segment);
    if (match == null) {
      final description = segment.trim();
      if (description.isNotEmpty) {
        return VoiceFoodEntryEntity(description: description);
      }
      return null;
    }

    final quantityStr = match.group(0)?.trim() ?? '';
    final description = segment.replaceFirst(match.group(0) ?? '', '').trim();

    if (description.isEmpty) return null;

    double? quantity;
    String? unit;

    final parts = quantityStr.split(RegExp(r'\s+'));
    if (parts.isNotEmpty) {
      quantity = _parseNumber(parts.first);
      if (parts.length > 1 && _unitMap.containsKey(parts.last.toLowerCase())) {
        unit = _unitMap[parts.last.toLowerCase()];
      } else if (_unitMap.containsKey(parts.first.toLowerCase())) {
        unit = _unitMap[parts.first.toLowerCase()];
        quantity ??= 1.0;
      }
    }

    return VoiceFoodEntryEntity(
      description: description,
      quantity: quantity,
      unit: unit,
    );
  }

  double? _parseNumber(String text) {
    final lower = text.toLowerCase();
    if (_wordNumbers.containsKey(lower)) {
      return _wordNumbers[lower];
    }
    return double.tryParse(text);
  }

  Future<List<MealEntity>> searchFoodForEntry(
      VoiceFoodEntryEntity entry) async {
    try {
      final offResults =
          await _productsRepository.getOFFProductsByString(entry.description);
      if (offResults.isNotEmpty) {
        return offResults;
      }
    } catch (e) {
      _log.warning('OFF search failed for "${entry.description}": $e');
    }

    try {
      final fdcResults =
          await _productsRepository.getFDCFoodsByString(entry.description);
      if (fdcResults.isNotEmpty) {
        return fdcResults;
      }
    } catch (e) {
      _log.warning('FDC search failed for "${entry.description}": $e');
    }

    return [];
  }
}
