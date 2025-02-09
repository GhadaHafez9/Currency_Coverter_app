import '../entities/currency_entity.dart';

abstract class CurrencyRepo {
  Future<CurrencyEntity> fetchExchangeRates(String baseCurrency);
}
