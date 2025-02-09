import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToTextfield extends StatelessWidget {
  ToTextfield({super.key});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrencyBloc, CurrencyState>(
      listenWhen: (previous, current) =>
      previous.convertedAmount != current.convertedAmount,
      listener: (context, state) {
       // resultController.text = state.convertedAmount.toStringAsFixed(4);
            },
      child: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state.status == CurrencyStatus.loaded) {
            return const CircularProgressIndicator();
          } else if (state.status == CurrencyStatus.loading) {
            resultController.text = state.convertedAmount.toStringAsFixed(4);
          } else if (state.status == CurrencyStatus.error) {
            return Text(state.errorMessage,
                style: const TextStyle(color: Colors.red));
          }
          return TextField(
            controller:resultController,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
            keyboardType: TextInputType.number,
            readOnly: true,
          );
        },
      ),
    );
  }
}
