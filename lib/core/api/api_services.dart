import 'package:currency_converter_app/core/api/api_config.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  Future<Map<String, dynamic>> getExchangeRates(String baseCurrency) async {
    try {
      final response = await dio.get(
        "${ApiConfig.baseUrl}/${ApiConfig.apiKey}/latest/$baseCurrency",
      );
      print("Base URL: ${ApiConfig.baseUrl}");

      if (response.statusCode == 200) {
        print("Success: ${response.data}");
        return response.data;
      } else {
        print("Error: ${response.statusCode} - ${response.statusMessage}");
        throw Exception("Failed to fetch exchange rates: ${response.statusMessage}");
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception("An error occurred while fetching exchange rates.");
    }
  }
}

