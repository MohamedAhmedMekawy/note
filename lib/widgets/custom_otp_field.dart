import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOTPField extends StatelessWidget {
  final double? width;
  final double? height;
  final int? length;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validatorFun;
  final bool isSecure;
  final bool readOnly;
  final Color backgroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function(String)? onCompleted;

  const CustomOTPField({
    super.key,
    this.width,
    required this.onChanged,
    this.validatorFun,
    this.isSecure = false,
    this.readOnly = false,
    this.backgroundColor = ColorManager.scaffoldBGColor,
    this.borderColor,
    this.controller,
    this.height,
    this.length,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        backgroundColor: ColorManager.scaffoldBGColor,
        length: length ?? 4,
        appContext: context,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        validator: validatorFun,
        controller: controller,
        enableActiveFill: true,
        enablePinAutofill: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textStyle: const TextStyle(
          fontSize: 18,
          color: ColorManager.offWhiteColor,
          fontWeight: FontWeight.normal,
        ),
        cursorColor: ColorManager.offWhiteColor,
        obscuringCharacter: "*",
        onChanged: onChanged,
        textInputAction: TextInputAction.done,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(15.radius),
          fieldHeight: height ?? 73.w,
          fieldWidth: width ?? 65.w,
          activeFillColor:
              borderColor ?? ColorManager.offWhiteColor.withOpacity(.6),
          activeColor: borderColor ??
              ColorManager.offWhiteColor.withOpacity(
                  .1), // This is the color of the pin field while it's active
          inactiveColor: borderColor ??
              ColorManager.offWhiteColor
                  .withOpacity(.1), // Color of the pin field which is inactive
          selectedColor: borderColor ??
              ColorManager.offWhiteColor
                  .withOpacity(.6), // Color of the pin field which is selected
          selectedFillColor:
              borderColor ?? ColorManager.offWhiteColor.withOpacity(.6),
          inactiveFillColor:
              borderColor ?? ColorManager.offWhiteColor.withOpacity(.6),
        ),
        onCompleted: onCompleted);
  }
}
