import 'package:currency_converter_app/core/constants/const.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/widgets/from_currency.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/widgets/to_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class currencyCard extends StatefulWidget {

  currencyCard({super.key});

  @override
  State<currencyCard> createState() => _currencyCardState();
}

class _currencyCardState extends State<currencyCard> {
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = AppConst.currencies.first;
  String toCurrency = AppConst.currencies.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Card(
          color: const Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      color: const Color(0xff989898),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const FromCurrency(),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Converted Amount',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      color: const Color(0xff989898),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const ToCurrency(),

              ],
            ),
          ),
        );
      },
    );
  }
}
