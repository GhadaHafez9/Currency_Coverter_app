import 'package:currency_converter_app/features/Currrency/Data/data_source/currency_conversion_data_source.dart';
import 'package:currency_converter_app/features/Currrency/Domain/entities/currency_entity.dart';
import 'package:currency_converter_app/features/Currrency/Domain/repo/currency_repo.dart';

class CurrencyRepositoryImpl implements CurrencyRepo {
  final CurrencyRemoteDataSource remoteDataSource;

  CurrencyRepositoryImpl(this.remoteDataSource);

  @override
  Future<CurrencyEntity> fetchExchangeRates(String baseCurrency) async {
    return await remoteDataSource.fetchExchangeRates(baseCurrency);
  }
}