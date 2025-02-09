part of 'currency_converter_bloc.dart';

enum CurrencyStatus { initial, loaded, loading, error  }

class CurrencyState extends Equatable {
  final String country ;
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final double convertedAmount;
  final CurrencyStatus status;
  final String errorMessage;
  final double exchangeRate ;

  CurrencyState({
    this.fromCurrency = "",
    this.toCurrency = "",
    this.amount = 0.0,
    this.convertedAmount = 0.0,
    this.status = CurrencyStatus.initial,
    this.errorMessage = "",
    this.exchangeRate = 0.0,
    this.country = "",
  });

  CurrencyState copyWith({
    String? fromCurrency,
    String? toCurrency,
    double? amount,
    double? convertedAmount,
    CurrencyStatus? status,
    String? errorMessage,
    double? exchangeRate,
      String? country,
  }) {
    return CurrencyState(
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      amount: amount ?? this.amount,
      convertedAmount: convertedAmount ?? this.convertedAmount,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      exchangeRate: exchangeRate?? this.exchangeRate,
      country: country?? this.country,
    );
  }

  @override
  List<Object?> get props => [
    fromCurrency,
    toCurrency,
    amount,
    convertedAmount,
    status,
    errorMessage,
    exchangeRate,
    country,
  ];
}

