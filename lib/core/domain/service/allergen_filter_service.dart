import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

/// Mapping of common food keywords to allergen types.
/// Used to identify allergens in food items that don't have
/// explicit allergen tagging from the API.
const Map<String, Set<AllergenType>> _allergenKeywords = {
  // Gluten-containing grains
  'wheat': {AllergenType.gluten},
  'barley': {AllergenType.gluten},
  'rye': {AllergenType.gluten},
  'bread': {AllergenType.gluten},
  'pasta': {AllergenType.gluten},
  'flour': {AllergenType.gluten},
  'cereals': {AllergenType.gluten},
  'cereal': {AllergenType.gluten},
  'spaghetti': {AllergenType.gluten},
  'noodles': {AllergenType.gluten},
  'crackers': {AllergenType.gluten},
  'pastry': {AllergenType.gluten},
  'cake': {AllergenType.gluten},
  'cookie': {AllergenType.gluten},
  'biscuit': {AllergenType.gluten},
  ' dough ': {AllergenType.gluten},
  // Dairy
  'milk': {AllergenType.dairy},
  'cheese': {AllergenType.dairy},
  'butter': {AllergenType.dairy},
  'cream': {AllergenType.dairy},
  'yogurt': {AllergenType.dairy},
  'yoghurt': {AllergenType.dairy},
  'whey': {AllergenType.dairy},
  'lactose': {AllergenType.dairy},
  'casein': {AllergenType.dairy},
  // Soy
  'soy': {AllergenType.soy},
  'soya': {AllergenType.soy},
  'soybean': {AllergenType.soy},
  'soybeans': {AllergenType.soy},
  'tofu': {AllergenType.soy},
  'tempeh': {AllergenType.soy},
  'edamame': {AllergenType.soy},
  'miso': {AllergenType.soy},
  // Nuts (tree nuts)
  'almond': {AllergenType.nuts},
  'almonds': {AllergenType.nuts},
  'hazelnut': {AllergenType.nuts},
  'hazelnuts': {AllergenType.nuts},
  'walnut': {AllergenType.nuts},
  'walnuts': {AllergenType.nuts},
  'cashew': {AllergenType.nuts},
  'cashews': {AllergenType.nuts},
  'pecan': {AllergenType.nuts},
  'pecans': {AllergenType.nuts},
  'brazil nut': {AllergenType.nuts},
  'pistachio': {AllergenType.nuts},
  'macadamia': {AllergenType.nuts},
  // Shellfish
  'shrimp': {AllergenType.shellfish},
  'prawn': {AllergenType.shellfish},
  'prawns': {AllergenType.shellfish},
  'crab': {AllergenType.shellfish},
  'lobster': {AllergenType.shellfish},
  'crayfish': {AllergenType.shellfish},
  'scallop': {AllergenType.shellfish},
  'scallops': {AllergenType.shellfish},
  // Eggs
  'egg': {AllergenType.eggs},
  'eggs': {AllergenType.eggs},
  'mayonnaise': {AllergenType.eggs},
  'mayo': {AllergenType.eggs},
  // Fish
  'fish': {AllergenType.fish},
  'salmon': {AllergenType.fish},
  'tuna': {AllergenType.fish},
  'cod': {AllergenType.fish},
  'sardine': {AllergenType.fish},
  'sardines': {AllergenType.fish},
  'anchovy': {AllergenType.fish},
  'anchovies': {AllergenType.fish},
  'trout': {AllergenType.fish},
  'mackerel': {AllergenType.fish},
  'haddock': {AllergenType.fish},
  // Sesame
  'sesame': {AllergenType.sesame},
  'tahini': {AllergenType.sesame},
  'humus': {AllergenType.sesame},
  'hummus': {AllergenType.sesame},
  // Peanuts
  'peanut': {AllergenType.peanuts},
  'peanuts': {AllergenType.peanuts},
  'peanut butter': {AllergenType.peanuts},
  // Celery
  'celery': {AllergenType.celery},
  'celeriac': {AllergenType.celery},
  // Mustard
  'mustard': {AllergenType.mustard},
  // Molluscs
  'mussel': {AllergenType.molluscs},
  'mussels': {AllergenType.molluscs},
  'oyster': {AllergenType.molluscs},
  'oysters': {AllergenType.molluscs},
  'squid': {AllergenType.molluscs},
  'snail': {AllergenType.molluscs},
  'escargot': {AllergenType.molluscs},
  'clam': {AllergenType.molluscs},
  'clams': {AllergenType.molluscs},
  // Lupin
  'lupin': {AllergenType.lupin},
  'lupine': {AllergenType.lupin},
  'lupini': {AllergenType.lupin},
  // Sulphur dioxide / sulphites
  'sulphite': {AllergenType.sulphurDioxide},
  'sulfite': {AllergenType.sulphurDioxide},
  'sulphur': {AllergenType.sulphurDioxide},
  'sulfur': {AllergenType.sulphurDioxide},
  'wine': {AllergenType.sulphurDioxide},
  'dried fruit': {AllergenType.sulphurDioxide},
};

class AllergenFilterService {
  /// Detects allergens present in a food item based on its name and brands.
  Set<AllergenType> detectAllergens(MealEntity meal) {
    final detected = <AllergenType>{};
    final searchText = '${meal.name ?? ''} ${meal.brands ?? ''}'.toLowerCase();

    for (final entry in _allergenKeywords.entries) {
      // Use word-boundary-aware matching to avoid false positives
      // e.g., "butter" should not match in "butterfly"
      final keyword = entry.key.trim();
      if (keyword.length <= 2) {
        // Short keywords use exact match
        if (searchText.contains(keyword)) {
          detected.addAll(entry.value);
        }
      } else {
        // Longer keywords: check if keyword appears as a word
        final pattern = RegExp(r'\b' + RegExp.escape(keyword) + r'\b',
            caseSensitive: false);
        if (pattern.hasMatch(searchText)) {
          detected.addAll(entry.value);
        }
      }
    }

    return detected;
  }

  /// Filters out foods containing user's allergens.
  /// Returns foods that do NOT contain any of the user's allergens.
  List<MealEntity> filterByAllergens(
    List<MealEntity> results,
    Set<AllergenType> allergens,
  ) {
    if (allergens.isEmpty) return results;

    return results.where((meal) {
      final detected = detectAllergens(meal);
      return detected.intersection(allergens).isEmpty;
    }).toList();
  }

  /// Returns the set of allergens in a food item that match the user's allergens.
  Set<AllergenType> getMatchingAllergens(
    MealEntity meal,
    Set<AllergenType> userAllergens,
  ) {
    if (userAllergens.isEmpty) return {};
    final detected = detectAllergens(meal);
    return detected.intersection(userAllergens);
  }
}
