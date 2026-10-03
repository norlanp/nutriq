import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

/// Ranks food search candidates by relevance to what the user typed.
///
/// Public databases return matches in an arbitrary order and frequently
/// include loosely related or nutritionally empty records. This service
/// scores each candidate against the query, prefers brand matches, drops
/// records that share no meaningful token with the query, and removes
/// duplicates.
class FoodSearchRanker {
  const FoodSearchRanker();

  static const int _minTokenLength = 3;

  List<MealEntity> rank(List<MealEntity> candidates, String query) {
    final queryTokens = tokenize(query);
    if (queryTokens.isEmpty || candidates.isEmpty) return candidates;

    final bestByKey = <String, MealEntity>{};
    final bestScoreByKey = <String, double>{};

    for (final meal in candidates) {
      final score = _score(meal, queryTokens);
      if (score <= 0) continue;
      final key = _deduplicationKey(meal);
      final previous = bestScoreByKey[key];
      if (previous == null || score > previous) {
        bestByKey[key] = meal;
        bestScoreByKey[key] = score;
      }
    }

    final keys = bestByKey.keys.toList()
      ..sort((a, b) => bestScoreByKey[b]!.compareTo(bestScoreByKey[a]!));

    return keys.map((key) => bestByKey[key]!).toList();
  }

  static List<String> tokenize(String? value) {
    if (value == null) return const [];
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), ' ')
        .trim()
        .split(' ')
        .where((token) => token.isNotEmpty)
        .toList();
  }

  static double _score(MealEntity meal, List<String> queryTokens) {
    final nameTokens = tokenize(meal.name);
    final brandTokens = tokenize(meal.brands);
    if (nameTokens.isEmpty && brandTokens.isEmpty) return 0;

    var matched = 0;
    var brandMatched = false;
    for (final token in queryTokens) {
      final inName = _containsMatch(nameTokens, token);
      if (inName) matched++;
      if (_containsMatch(brandTokens, token)) {
        brandMatched = true;
        if (!inName) matched++;
      }
    }

    if (matched == 0) return 0;

    final matchedNameTokens = nameTokens
        .where((token) => queryTokens.any((q) => _containsMatch([token], q)))
        .length;
    final precision = nameTokens.isEmpty
        ? 0.0
        : matchedNameTokens / nameTokens.length;

    var score = (matched / queryTokens.length) * 100;
    score += precision * 20;
    if (brandMatched) score += 60;
    if (_containsFullPhrase(nameTokens, queryTokens)) score += 40;
    score += _completenessScore(meal.nutriments);
    return score;
  }

  static bool _containsFullPhrase(
    List<String> nameTokens,
    List<String> queryTokens,
  ) {
    if (queryTokens.length < 2 || nameTokens.length < queryTokens.length) {
      return false;
    }
    return nameTokens.join(' ').contains(queryTokens.join(' '));
  }

  static bool _containsMatch(List<String> tokens, String query) {
    if (query.length < _minTokenLength) return tokens.contains(query);
    for (final token in tokens) {
      if (token == query) return true;
      if (token.startsWith(query) || query.startsWith(token)) return true;
      if (token.length >= 4 &&
          query.length >= 4 &&
          _isWithinEditDistanceOne(token, query)) {
        return true;
      }
    }
    return false;
  }

  static double _completenessScore(MealNutrimentsEntity nutriments) {
    final core = [
      nutriments.energyKcal100,
      nutriments.proteins100,
      nutriments.carbohydrates100,
      nutriments.fat100,
    ];
    return core.where((value) => value != null).length * 2.5;
  }

  static String _deduplicationKey(MealEntity meal) {
    final name = tokenize(meal.name).join(' ');
    if (name.isEmpty) return meal.code ?? '';
    return '${tokenize(meal.brands).join(' ')}|$name';
  }

  /// Bounded edit-distance check used for simple typos and truncations.
  static bool _isWithinEditDistanceOne(String a, String b) {
    if (a == b) return true;
    final lengthDiff = (a.length - b.length).abs();
    if (lengthDiff > 1) return false;

    if (lengthDiff == 0) {
      var differences = 0;
      for (var i = 0; i < a.length; i++) {
        if (a[i] != b[i]) differences++;
        if (differences > 1) return false;
      }
      return differences == 1;
    }

    final longer = a.length > b.length ? a : b;
    final shorter = a.length > b.length ? b : a;
    var longerIndex = 0;
    var shorterIndex = 0;
    var skipped = false;
    while (longerIndex < longer.length && shorterIndex < shorter.length) {
      if (longer[longerIndex] == shorter[shorterIndex]) {
        longerIndex++;
        shorterIndex++;
        continue;
      }
      if (skipped) return false;
      skipped = true;
      longerIndex++;
    }
    return true;
  }
}
