import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';
import 'package:nutriq/core/domain/exception/recipe_import_exception.dart';
import 'package:nutriq/core/domain/service/recipe_scraper_service.dart';

class RecipeScraperServiceImpl implements RecipeScraperService {
  static const _blockedHosts = [
    'localhost',
    '127.0.0.1',
    '::1',
    '0.0.0.0',
    '169.254.169.254',
  ];

  static const _blockedPrefixes = [
    '10.',
    '172.16.',
    '172.17.',
    '172.18.',
    '172.19.',
    '172.20.',
    '172.21.',
    '172.22.',
    '172.23.',
    '172.24.',
    '172.25.',
    '172.26.',
    '172.27.',
    '172.28.',
    '172.29.',
    '172.30.',
    '172.31.',
    '192.168.',
  ];

  final Dio _dio;

  RecipeScraperServiceImpl(this._dio);

  @override
  Future<ScrapedRecipeEntity?> scrapeRecipe(String url) async {
    final uri = Uri.parse(url);

    if (uri.scheme != 'https') {
      throw RecipeImportException(
        'Only HTTPS URLs are allowed',
        RecipeImportErrorType.networkError,
      );
    }

    final host = uri.host;
    if (_blockedHosts.contains(host) ||
        _blockedPrefixes.any((prefix) => host.startsWith(prefix))) {
      throw RecipeImportException(
        'Internal or local URLs are not allowed',
        RecipeImportErrorType.networkError,
      );
    }

    String html;
    try {
      final response = await _dio.get<String>(url);
      html = response.data!;
    } on DioException catch (e) {
      throw RecipeImportException(
        'Failed to fetch URL: ${e.message}',
        RecipeImportErrorType.networkError,
      );
    }

    return _parseRecipeFromHtml(html, url);
  }

  ScrapedRecipeEntity? _parseRecipeFromHtml(String html, String sourceUrl) {
    final jsonLdBlocks = _extractJsonLdBlocks(html);
    if (jsonLdBlocks.isEmpty) {
      throw RecipeImportException(
        'No recipe data found at URL',
        RecipeImportErrorType.noRecipeFound,
      );
    }

    for (final jsonStr in jsonLdBlocks) {
      try {
        final decoded = jsonDecode(jsonStr);
        final recipe = _extractRecipeFromJsonLd(decoded, sourceUrl);
        if (recipe != null) return recipe;
      } catch (_) {
        continue;
      }
    }

    throw RecipeImportException(
      'No recipe data found at URL',
      RecipeImportErrorType.noRecipeFound,
    );
  }

  ScrapedRecipeEntity? _extractRecipeFromJsonLd(
    dynamic jsonLd,
    String sourceUrl,
  ) {
    if (jsonLd is Map<String, dynamic>) {
      final graph = jsonLd['@graph'];
      if (graph is List) {
        for (final item in graph) {
          if (item is Map<String, dynamic> && _isRecipe(item)) {
            return _mapToRecipe(item, sourceUrl);
          }
        }
      }
      if (_isRecipe(jsonLd)) {
        return _mapToRecipe(jsonLd, sourceUrl);
      }
    }

    if (jsonLd is List) {
      for (final item in jsonLd) {
        if (item is Map<String, dynamic> && _isRecipe(item)) {
          return _mapToRecipe(item, sourceUrl);
        }
      }
    }

    return null;
  }

  bool _isRecipe(Map<String, dynamic> json) {
    final type = json['@type'];
    if (type is String) return type == 'Recipe';
    if (type is List) return type.contains('Recipe');
    return false;
  }

  ScrapedRecipeEntity _mapToRecipe(
    Map<String, dynamic> json,
    String sourceUrl,
  ) {
    final ingredients = _extractStringList(json['recipeIngredient']);
    final instructions = _extractInstructions(json['recipeInstructions']);
    final nutrition = json['nutrition'] as Map<String, dynamic>?;

    return ScrapedRecipeEntity(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ingredients: ingredients,
      instructions: instructions,
      servings: _parseInt(json['recipeYield']),
      prepTimeMinutes: _parseDurationMinutes(json['prepTime']),
      cookTimeMinutes: _parseDurationMinutes(json['cookTime']),
      calories: _parseNutritionValue(nutrition, [
        'calories',
        'Calories',
      ]),
      proteinG: _parseNutritionValue(nutrition, [
        'proteinContent',
        'protein',
        'Protein',
      ]),
      carbsG: _parseNutritionValue(nutrition, [
        'carbohydrateContent',
        'carbs',
        'Carbohydrates',
      ]),
      fatG: _parseNutritionValue(nutrition, [
        'fatContent',
        'fat',
        'Fat',
      ]),
      sourceUrl: sourceUrl,
    );
  }

  List<String> _extractStringList(dynamic value) {
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    if (value is String) {
      return [value];
    }
    return [];
  }

  List<String> _extractInstructions(dynamic value) {
    if (value is List) {
      return value.map((step) {
        if (step is String) return step;
        if (step is Map<String, dynamic>) {
          return step['text'] as String? ?? step.toString();
        }
        return step.toString();
      }).toList();
    }
    if (value is String) {
      return [value];
    }
    return [];
  }

  int? _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is List && value.isNotEmpty) {
      return int.tryParse(value.first.toString());
    }
    return null;
  }

  int? _parseDurationMinutes(dynamic value) {
    if (value == null) return null;
    if (value is! String) return null;

    final isoMatch = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?').firstMatch(value);
    if (isoMatch != null) {
      final hours = int.tryParse(isoMatch.group(1) ?? '0') ?? 0;
      final minutes = int.tryParse(isoMatch.group(2) ?? '0') ?? 0;
      return hours * 60 + minutes;
    }

    return int.tryParse(value);
  }

  double? _parseNutritionValue(
    Map<String, dynamic>? nutrition,
    List<String> keys,
  ) {
    if (nutrition == null) return null;

    for (final key in keys) {
      final value = nutrition[key];
      if (value != null) {
        final numStr = value.toString().replaceAll(RegExp(r'[^\d.]'), '');
        if (numStr.isNotEmpty) {
          return double.tryParse(numStr);
        }
      }
    }
    return null;
  }

  List<String> _extractJsonLdBlocks(String html) {
    final results = <String>[];
    final openTag = '<script type="application/ld+json">';
    final closeTag = '</script>';
    var searchStart = 0;
    while (true) {
      final openIndex = html.indexOf(openTag, searchStart);
      if (openIndex == -1) break;
      final contentStart = openIndex + openTag.length;
      final closeIndex = html.indexOf(closeTag, contentStart);
      if (closeIndex == -1) break;
      final content = html.substring(contentStart, closeIndex).trim();
      if (content.isNotEmpty) {
        results.add(content);
      }
      searchStart = closeIndex + closeTag.length;
    }
    final openTagAlt = "<script type='application/ld+json'>";
    searchStart = 0;
    while (true) {
      final openIndex = html.indexOf(openTagAlt, searchStart);
      if (openIndex == -1) break;
      final contentStart = openIndex + openTagAlt.length;
      final closeIndex = html.indexOf(closeTag, contentStart);
      if (closeIndex == -1) break;
      final content = html.substring(contentStart, closeIndex).trim();
      if (content.isNotEmpty) {
        results.add(content);
      }
      searchStart = closeIndex + closeTag.length;
    }
    return results;
  }
}