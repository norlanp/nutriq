class FDCConst {
  static const _pageSize = "20";

  // URL
  static const fdcWebsiteUrl = "https://fdc.nal.usda.gov/fdc-app.html#";
  static const _fdcFoodDetailPath = "/food-details/";
  static const _fdcFoodDetailNutrientsPath = "/nutrients";
  static const _fdcBaseUrl = "api.nal.usda.gov";
  static const _fdcFoodSearchPath = "/fdc/v1/foods/search";

  static const _fdcQueryTag = "query";
  static const _fdcPageSizeTag = "pageSize";
  static const _fdcDataTypeTag = "dataType";
  static const _fdcSortOrderTag = "sortOrder";
  static const _fdcSortOrderAscValue = "asc";
  static const _fdcApiKeyTag = "api_key";

  /// Generic, non-branded foods (commodity and legacy reference entries).
  static const genericDataTypes = [
    FdcDataType.foundation,
    FdcDataType.srLegacy,
  ];

  /// Manufacturer and restaurant products, keyed by brand or GTIN/UPC.
  static const brandedDataTypes = [FdcDataType.branded];

  static String getFoodDetailUrlString(String? code) {
    if (code == null) {
      return _fdcBaseUrl;
    } else {
      return fdcWebsiteUrl +
          _fdcFoodDetailPath +
          code +
          _fdcFoodDetailNutrientsPath;
    }
  }

  static Uri getFDCWordSearchUrl(
    String searchString,
    String apiKey, {
    List<FdcDataType> dataTypes = genericDataTypes,
  }) {
    final queryParameters = {
      _fdcQueryTag: searchString,
      _fdcPageSizeTag: _pageSize,
      _fdcDataTypeTag: dataTypes.map((type) => type.value).join(","),
      _fdcSortOrderTag: _fdcSortOrderAscValue,
      _fdcApiKeyTag: apiKey
    };

    return Uri.https(_fdcBaseUrl, _fdcFoodSearchPath, queryParameters);
  }

  // Nutriment codes
  static const fdcTotalKcalId = 1008;
  static const fdcKcalAtwaterGeneralId = 957;
  static const fdcKcalAtwaterSpecificId = 958;
  static const fdcTotalCarbsId = 1005;
  static const fdcTotalFatId = 1004;
  static const fdcTotalProteinsId = 1003;
  static const fdcTotalSugarId = 1063;

  /// Branded entries report total sugars under the newer nutrient id.
  static const fdcTotalSugarAltId = 2000;
  static const fdcTotalSaturatedFatId = 1258;
  static const fdcTotalDietaryFiberId = 1079;

  // Micronutrient codes
  static const fdcSodiumId = 1093;
  static const fdcPotassiumId = 1092;
  static const fdcCholesterolId = 1253;
  static const fdcVitaminAId = 1106;
  static const fdcVitaminCId = 1162;
  static const fdcVitaminDId = 1114;
  static const fdcCalciumId = 1087;
  static const fdcIronId = 1089;
}

/// USDA FoodData Central record categories used for search.
enum FdcDataType {
  foundation('Foundation'),
  srLegacy('SR Legacy'),
  branded('Branded');

  const FdcDataType(this.value);

  final String value;
}
