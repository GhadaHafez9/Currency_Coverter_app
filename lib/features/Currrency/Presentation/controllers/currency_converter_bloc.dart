import 'package:bloc/bloc.dart';
import 'package:currency_converter_app/features/Currrency/Domain/usecases/currency_conversion.dart';
import 'package:equatable/equatable.dart';

part 'currency_converter_event.dart';
part 'currency_converter_state.dart';


class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final ConvertCurrencyUseCase convertCurrency;

  CurrencyBloc(this.convertCurrency) : super(CurrencyState()) {
    on<ConvertCurrencyEvent>((event, emit) async {
      emit(state.copyWith(status: CurrencyStatus.loading));
      try {
        final result = await convertCurrency.execute(event.from, event.to, event.amount);
        final convertedAmount = result['convertedAmount'];
        final exchangeRate = result['exchangeRate'];

        emit(state.copyWith(
          convertedAmount: convertedAmount,
          exchangeRate: exchangeRate,));
      } catch (e) {
        emit(state.copyWith(
          status: CurrencyStatus.error,
          errorMessage: "Conversion failed",
        ));
      }
    });
    on<ResetCurrencyEvent>((event, emit) {
      emit(state.copyWith(
        convertedAmount: null,
        exchangeRate: null,
        errorMessage: null,
        fromCurrency: null,
        toCurrency: null,
        status: CurrencyStatus.initial,
      ));
    });
    on<ChangeFromCurrencyEvent>((event, emit) {
      emit(state.copyWith(fromCurrency: event.fromCurrency));
    });

    on<ChangeToCurrencyEvent>((event, emit) {
      emit(state.copyWith(toCurrency: event.toCurrency));
      if (state.amount > 0) {
        add(ConvertCurrencyEvent(state.fromCurrency, event.toCurrency, state.amount));
      }
    });
  }
}
