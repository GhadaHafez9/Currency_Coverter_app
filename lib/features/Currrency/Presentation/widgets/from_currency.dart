import 'dart:async';
import 'package:currency_converter_app/core/constants/const.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cust_icon.dart';

class FromCurrency extends StatefulWidget {
  const FromCurrency({super.key});

  @override
  State<FromCurrency> createState() => _FromCurrencyState();
}

class _FromCurrencyState extends State<FromCurrency> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String fromCurrency = AppConst.currencies.first;
  String toCurrency = AppConst.currencies.first;

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    value: fromCurrency,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                    items: AppConst.currencies.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        fromCurrency = newValue!;
                      });
                      context.read<CurrencyBloc>().add(ChangeFromCurrencyEvent(fromCurrency));
                      if (amountController.text.isNotEmpty) {
                        context.read<CurrencyBloc>().add(
                          ConvertCurrencyEvent(
                            newValue!,
                            toCurrency,
                            double.tryParse(amountController.text) ?? 0.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 1,
                  child: TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 1000),
                              () {
                            if (text.isNotEmpty) {
                              context.read<CurrencyBloc>().add(
                                ConvertCurrencyEvent(
                                  fromCurrency,
                                  toCurrency,
                                  double.tryParse(text) ?? 0.0,
                                ),
                              );
                            }
                          },
                        );
                      }),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            CustIcon(
              amountController: amountController,
              resultController: resultController,
            ),
          ],
        );
      },
    );
  }
}
