
import 'package:currency_converter_app/core/api/api_services.dart';
import 'package:currency_converter_app/features/Currrency/Data/Models/currency_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<CurrencyModel> fetchExchangeRates(String baseCurrency);
}

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final ApiServices apiService;

  CurrencyRemoteDataSourceImpl(this.apiService);

  @override
  Future<CurrencyModel> fetchExchangeRates(String baseCurrency) async {
    final data = await apiService.getExchangeRates(baseCurrency);
    return CurrencyModel.fromJson(data);
  }
}