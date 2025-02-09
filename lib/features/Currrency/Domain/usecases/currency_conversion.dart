import 'package:currency_converter_app/features/Currrency/Domain/repo/currency_repo.dart';

class ConvertCurrencyUseCase {
  final CurrencyRepo repository;

  ConvertCurrencyUseCase(this.repository);

  Future<Map<String, double>> execute(String from, String to, double amount) async {
    final currency = await repository.fetchExchangeRates(from);
    if (!currency.rates.containsKey(to)) {
      throw Exception("Conversion rate not found for the selected currency.");
    }
    final rate = currency.rates[to];
    if (rate == null) {
      throw Exception("Conversion rate not found");
    }
    final convertedAmount = amount * rate;
    return {
      'convertedAmount': convertedAmount,
      'exchangeRate': rate,
    };
  }
}