class CurrencyEntity {
  final String base;
  final Map<String, double> rates;

  const CurrencyEntity({
    required this.base,
    required this.rates,
  });
}
