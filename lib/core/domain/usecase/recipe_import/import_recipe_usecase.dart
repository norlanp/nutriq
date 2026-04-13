import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';
import 'package:nutriq/core/domain/service/recipe_scraper_service.dart';

class ImportRecipeUsecase {
  final RecipeScraperService _scraperService;

  ImportRecipeUsecase(this._scraperService);

  Future<ScrapedRecipeEntity> call(String url) async {
    final recipe = await _scraperService.scrapeRecipe(url);
    if (recipe == null) {
      throw Exception('No recipe found at URL');
    }
    return recipe;
  }
}
