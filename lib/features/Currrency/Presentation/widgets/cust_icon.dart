import 'dart:io';

import 'package:currency_converter_app/features/Currrency/Presentation/controllers/currency_converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustIcon extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController resultController;

  const CustIcon(
      {super.key, required this.amountController, required this.resultController});


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Material(
                  elevation: 4,
                  color: const Color(0xff26278D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<CurrencyBloc>().add(ResetCurrencyEvent());
                       amountController.clear();
                       resultController.clear();
                      print("Clearing the amount field");
                    },
                    borderRadius: BorderRadius.circular(50.r),
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.sync_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                )

            ),
            const Flexible(
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        );
      },
    );
  }
}
