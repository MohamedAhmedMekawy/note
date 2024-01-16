import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final bool? isAlwaysAndroid;
  final double? borderWidth;
  const CustomLoadingWidget(
      {super.key,
      this.color,
      this.size,
      this.isAlwaysAndroid = false,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isAlwaysAndroid ?? false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100.radius,
              width: 100.radius,
              decoration: BoxDecoration(
                color: ColorManager.scaffoldBGColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorManager.darkGrayColor, width: 2),
              ),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: ColorManager.yellowColor,
                strokeWidth: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
