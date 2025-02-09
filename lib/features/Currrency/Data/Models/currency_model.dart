import 'package:currency_converter_app/features/Currrency/Domain/entities/currency_entity.dart';

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel({
    required String base,
    required Map<String, double> rates})

      : super(base: base,
      rates: rates);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      base: json["base_code"] ?? json["base"],
      rates: (json["conversion_rates"] as Map<String, dynamic>? ?? {}).map(
            (key, value) => MapEntry(key, (value as num?)?.toDouble() ?? 0.0),
      ),
    );
  }
}

