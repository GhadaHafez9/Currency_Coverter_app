import 'package:currency_converter_app/core/constants/const.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String fromCurrency = AppConst.currencies.first;
  String toCurrency = AppConst.currencies.first;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffEAEAFE), Colors.white
              //Color(0xffDDF6F3)
            ],
            begin: Alignment.topLeft,
            //end: Alignment.topRight
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Currency Converter',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: const Color(0xff1F2261),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'Check live rates, set rate alerts, receive \n notifications and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Roboto',
                      color: const Color(0xff808080),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: double.infinity,
                child: currencyCard(),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Indicative Exchange Rate: ',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto',
                    color: const Color(0xff989898),
                  ),
                ),
              ),
              BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (context, state) {
                  if (state.status == CurrencyStatus.loading) {
                    print("Converted Amount: ${state.convertedAmount}");
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '1 ${state.fromCurrency} = ${state.exchangeRate.toStringAsFixed(4)} ${state.toCurrency}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else if (state.status == CurrencyStatus.loaded) {
                    return const CircularProgressIndicator();
                  } else if (state.status == CurrencyStatus.error) {
                    return Text(state.errorMessage,
                        style: const TextStyle(color: Colors.red));
                  } else if (state.status == CurrencyStatus.initial) {
                    resultController.clear();
                    toCurrency='';
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter values to convert",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    );
                  }
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Enter values to convert",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
