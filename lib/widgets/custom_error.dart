import 'package:flutter/material.dart';
import 'package:notes_app/config/locale/i18n.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/utils/app_utils/navigators.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomErroryWidget extends StatelessWidget {
  final String? errorMsg;
  final String? btnText;
  final VoidCallback? onPress;
  final bool showBtn;

  const CustomErroryWidget({
    super.key,
    this.errorMsg,
    this.onPress,
    this.btnText,
    this.showBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: ColorManager.redColor,
            radius: 40,
            child: Icon(
              Icons.clear_rounded,
              color: ColorManager.whiteColor,
              size: 30,
            ),
          ).verticalPadding(20),
          CustomText(
            title: S.of(context)!.ops,
            size: 24,
            fontWeight: FontWeight.bold,
          ),
          10.verticalSpace,
          CustomText(
            title: errorMsg ?? '',
            size: 16,
            fontWeight: FontWeight.w400,
            color: ColorManager.offWhiteColor.withOpacity(0.5),
            align: TextAlign.center,
          ),
          if (showBtn)
            CustomButton(
              onTap: onPress ?? () => popRoute(),
              text: S.of(context)!.reload,
              btnWidth: 0.5.widthPercentage,
            ),
        ],
      )),
    );
  }
}
