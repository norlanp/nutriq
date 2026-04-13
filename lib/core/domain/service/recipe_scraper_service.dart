import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';

abstract class RecipeScraperService {
  Future<ScrapedRecipeEntity?> scrapeRecipe(String url);
}
