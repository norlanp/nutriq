import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/menu_scan/data/menu_item_parser_service.dart';
import 'package:nutriq/features/menu_scan/data/menu_scanner_service.dart';
import 'package:nutriq/features/menu_scan/domain/entity/scanned_menu_item.dart';

class ScanMenuUsecase {
  final log = Logger('ScanMenuUsecase');
  final MenuScannerService _scannerService;
  final MenuItemParserService _parserService;
  final SearchProductsUseCase _searchProductsUseCase;

  ScanMenuUsecase(
    this._scannerService,
    this._parserService,
    this._searchProductsUseCase,
  );

  Future<List<ScannedMenuItem>> scanFromCamera() async {
    final ocrText = await _scannerService.captureAndScan();
    if (ocrText.isEmpty) return [];
    return await _processOcrText(ocrText);
  }

  Future<List<ScannedMenuItem>> scanFromGallery() async {
    final ocrText = await _scannerService.scanFromGallery();
    if (ocrText.isEmpty) return [];
    return await _processOcrText(ocrText);
  }

  Future<List<ScannedMenuItem>> _processOcrText(String ocrText) async {
    final parsedItems = _parserService.parseMenuText(ocrText);
    if (parsedItems.isEmpty) return [];

    final scannedItems = <ScannedMenuItem>[];

    for (final parsed in parsedItems) {
      final scannedItem = await _matchAndEnrich(parsed);
      scannedItems.add(scannedItem);
    }

    return scannedItems;
  }

  Future<ScannedMenuItem> _matchAndEnrich(ParsedMenuItem parsed) async {
    try {
      final fdcResults =
          await _searchProductsUseCase.searchFDCFoodByString(parsed.name);
      if (fdcResults.isNotEmpty) {
        final bestMatch = fdcResults.first;
        final n = bestMatch.nutriments;
        final grade = FoodGradeCalculator.calculate(
          calories: n.energyKcal100 ?? 0,
          proteinG: n.proteins100 ?? 0,
          fiberG: n.fiber100 ?? 0,
          sugarG: n.sugars100 ?? 0,
          sodiumMg: n.sodium100 ?? 0,
          totalFatG: n.fat100 ?? 0,
          saturatedFatG: n.saturatedFat100 ?? 0,
        );
        return ScannedMenuItem(
          name: parsed.name,
          menuPrice: parsed.price,
          mealMatch: bestMatch,
          foodGrade: grade,
          matchConfidence: 0.8,
        );
      }

      final offResults =
          await _searchProductsUseCase.searchOFFProductsByString(parsed.name);
      if (offResults.isNotEmpty) {
        final bestMatch = offResults.first;
        final n = bestMatch.nutriments;
        final grade = FoodGradeCalculator.calculate(
          calories: n.energyKcal100 ?? 0,
          proteinG: n.proteins100 ?? 0,
          fiberG: n.fiber100 ?? 0,
          sugarG: n.sugars100 ?? 0,
          sodiumMg: n.sodium100 ?? 0,
          totalFatG: n.fat100 ?? 0,
          saturatedFatG: n.saturatedFat100 ?? 0,
        );
        return ScannedMenuItem(
          name: parsed.name,
          menuPrice: parsed.price,
          mealMatch: bestMatch,
          foodGrade: grade,
          matchConfidence: 0.7,
        );
      }
    } catch (e) {
      log.warning('Product match failed: $e');
    }

    return ScannedMenuItem(
      name: parsed.name,
      menuPrice: parsed.price,
    );
  }
}
