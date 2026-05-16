import 'package:dio/dio.dart';
import 'package:nutriq/core/utils/env.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_word_response_dto.dart';

class FDCApiClient {
  final Dio _dio;

  FDCApiClient(this._dio);

  Future<FDCWordResponseDTO> searchFoods(String searchString) async {
    final uri = FDCConst.getFDCWordSearchUrl(searchString, Env.fdcApiKey);
    final response = await _dio.getUri(uri);

    if (response.statusCode == 200) {
      return FDCWordResponseDTO.fromJson(response.data as Map<String, dynamic>);
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      message: 'FDC search returned ${response.statusCode}',
    );
  }
}