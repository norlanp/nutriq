import 'package:dio/dio.dart';
import 'package:nutriq/core/utils/off_const.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_response_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_word_response_dto.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';

class OFFApiClient {
  final Dio _dio;

  OFFApiClient(this._dio);

  Future<OFFWordResponseDTO> searchProducts(String searchString) async {
    final uri = OFFConst.getOffWordSearchUrl(searchString);
    final response = await _dio.getUri(uri);

    if (response.statusCode == OFFConst.offHttpSuccessCode) {
      return OFFWordResponseDTO.fromJson(response.data as Map<String, dynamic>);
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      message: 'OFF search returned ${response.statusCode}',
    );
  }

  Future<OFFProductResponseDTO> getProductByBarcode(String barcode) async {
    final uri = OFFConst.getOffBarcodeSearchUri(barcode);

    try {
      final response = await _dio.getUri(uri);

      if (response.statusCode == OFFConst.offHttpSuccessCode) {
        final data = response.data as Map<String, dynamic>;
        final status = data['status'];
        if (status == 0) {
          throw ProductNotFoundException();
        }
        return OFFProductResponseDTO.fromJson(data);
      } else if (response.statusCode == OFFConst.offProductNotFoundCode) {
        throw ProductNotFoundException();
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'OFF returned ${response.statusCode}',
      );
    } on ProductNotFoundException {
      rethrow;
    } on DioException {
      rethrow;
    } catch (e) {
      throw ProductNotFoundException();
    }
  }
}