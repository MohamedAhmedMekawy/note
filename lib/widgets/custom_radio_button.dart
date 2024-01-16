import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    this.inactiveColor,
    this.activeColor,
    required this.value,
    required this.onTap,
    this.height,
    this.width,
    this.title,
  });
  final Color? inactiveColor;
  final Color? activeColor;
  final bool value;
  final Function() onTap;
  final double? width;
  final double? height;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(end: 6),
            height: height ?? 18.radius,
            width: width ?? 18.radius,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color:
                    value ? ColorManager.yellowColor : ColorManager.whiteColor,
                width: 1.9,
              ),
            ),
            child: value
                ? Center(
                    child: Container(
                      height: 10.radius,
                      width: 10.radius,
                      decoration: BoxDecoration(
                        color: ColorManager.yellowColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                : null,
          ),
          CustomText(
            title: title,
            color: ColorManager.whiteColor,
            size: 13,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
