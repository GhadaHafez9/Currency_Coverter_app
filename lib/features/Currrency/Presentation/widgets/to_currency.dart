import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:currency_converter_app/features/Currrency/Presentation/widgets/to_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/const.dart';

class ToCurrency extends StatefulWidget {
  const ToCurrency({super.key});

  @override
  State<ToCurrency> createState() => _ToCurrencyState();
}

class _ToCurrencyState extends State<ToCurrency> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController resultController = TextEditingController();
  String fromCurrency = AppConst.currencies.first;
  String toCurrency = AppConst.currencies.first;

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: DropdownButton<String>(
                value: toCurrency,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                  size: 24.sp,
                ),
                items: AppConst.currencies.map<DropdownMenuItem<String>>((
                    String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  print("$newValue");
                  setState(() {
                    toCurrency = newValue!;
                  });
                  print("Selected currency: $toCurrency");
                  context.read<CurrencyBloc>().add(ChangeToCurrencyEvent(toCurrency));

                  if (amountController.text.isNotEmpty) {
                    context.read<CurrencyBloc>().add(
                      ConvertCurrencyEvent(
                        fromCurrency,
                        newValue!,
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
              child: ToTextfield(),
            ),
          ],
        );
      }
    );
  }
}
