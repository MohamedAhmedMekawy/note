import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomSuccessfullyWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final String? msg;

  const CustomSuccessfullyWidget({
    super.key,
    this.color,
    this.size,
    this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230.radius,
                  width: 230.radius,
                  decoration: BoxDecoration(
                    color: ColorManager.scaffoldBGColor,
                    border: Border.all(
                      color: ColorManager.accentColor.withOpacity(0.5),
                      width: 10.radius,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 170.radius,
                  width: 170.radius,
                  decoration: BoxDecoration(
                    color: ColorManager.scaffoldBGColor,
                    border: Border.all(
                      color: ColorManager.accentColor.withOpacity(0.8),
                      width: 10.radius,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 100.radius,
                  width: 100.radius,
                  decoration: const BoxDecoration(
                    color: ColorManager.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 50.radius,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ],
            ),
            CustomText(
              title: msg ?? 'Successfully',
              size: 20,
              color: ColorManager.blackColor,
              align: TextAlign.center,
            ).allPadding(20)
          ],
        ),
      ),
    );
  }
}
