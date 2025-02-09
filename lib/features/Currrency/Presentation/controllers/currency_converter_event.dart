part of 'currency_converter_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class ChangeFromCurrencyEvent extends CurrencyEvent {
  final String fromCurrency;

  const ChangeFromCurrencyEvent(this.fromCurrency);

  @override
  List<Object> get props => [fromCurrency];
}

class ChangeToCurrencyEvent extends CurrencyEvent {
  final String toCurrency ;

  const ChangeToCurrencyEvent(this.toCurrency);

  @override
  List<Object> get props => [toCurrency];
}

class ConvertCurrencyEvent extends CurrencyEvent {
  final String from;
  final String to;
  final double amount;

  const ConvertCurrencyEvent(this.from, this.to, this.amount);

  @override
  List<Object> get props => [from, to, amount];
}
class ResetCurrencyEvent extends CurrencyEvent {}
