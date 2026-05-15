import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';

abstract class RecipeCatalogService {
  Future<List<CatalogRecipeEntity>> loadCatalog();
}

class RecipeCatalogServiceImpl implements RecipeCatalogService {
  static const _assetPath = 'assets/recipes/catalog.json';

  @override
  Future<List<CatalogRecipeEntity>> loadCatalog() async {
    final jsonStr = await rootBundle.loadString(_assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonStr) as List<dynamic>;
    return jsonList
        .map((e) => CatalogRecipeEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
