import 'package:flutter/material.dart';
// import 'package:notes_app/providers/admin_data_provider.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider(
      {super.key,
      required this.currentRangeValues,
      this.onChanged,
      this.title});

  final RangeValues currentRangeValues;
  final void Function(RangeValues)? onChanged;
  final String? title;

  @override
  Widget build(BuildContext context) {
    // final AdminDataProvider adminDataProvider =
    //     Provider.of(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              title: title,
              color: ColorManager.yellowColor,
              size: 16,
            ),
            const Spacer(),
            CustomText(
              title: r"$"
                  "${currentRangeValues.start.round().toString()}"
                  '  -  '
                  r"$"
                  "${currentRangeValues.end.round().toString()}",
              color: ColorManager.greenColor,
              size: 16.sp,
            ),
          ],
        ),
        RangeSlider(
          values: currentRangeValues,
          min:
              //  (adminDataProvider.priceModel?.data?.lowestPrice)?.toDouble() ??
              0.0,
          max:
              // (adminDataProvider.priceModel?.data?.highestPrice)?.toDouble() ??
              0.0,
          //divisions: 8,
          labels: RangeLabels(
            currentRangeValues.start.round().toString(),
            currentRangeValues.end.round().toString(),
          ),

          onChanged: onChanged,
        ),
      ],
    );
  }
}
