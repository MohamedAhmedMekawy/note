import 'package:flutter/material.dart';
import 'package:notes_app/config/locale/i18n.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final String titleText;
  final String initialValue;
  final ValueChanged<dynamic>? onChanged;
  final Object? selectedValue;
  final List<DropdownMenuItem<Object>>? items;
  final double? width;
  final bool isActive;
  final bool isRequierd;
  final bool isShadow;
  final bool showClearIcon;
  final dynamic onClearFun;
  final String? Function(Object?)? validatorFun;
  final EdgeInsetsGeometry? contentPadding;

  final Color? hintColor;
  final double? hintsize;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final String? errorText;
  final String? title;
  final Color? titleColor;

  final double? borderRadius;

  final TextAlign? textAlign;

  final Widget? suffixWidget;

  const CustomDropdown({
    super.key,
    this.hintText = "",
    this.titleText = "",
    this.onChanged,
    this.selectedValue,
    required this.items,
    this.initialValue = "",
    this.width,
    this.onClearFun,
    this.isActive = true,
    this.isRequierd = true,
    this.showClearIcon = false,
    this.isShadow = true,
    this.contentPadding,
    this.validatorFun,
    this.hintColor,
    this.hintsize,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.errorText,
    this.title,
    this.titleColor,
    this.borderRadius,
    this.textAlign,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //20.verticalSpace,
        if (title != null)
          CustomText(
            title: title,
            size: 14,
            color: titleColor ?? ColorManager.offWhiteColor,
          ),
        if (title != null) 22.verticalSpace,
        DropdownButtonFormField(
          dropdownColor: ColorManager.yellowColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          isExpanded: true,
          iconEnabledColor: ColorManager.whiteColor,
          elevation: 0,
          iconDisabledColor: ColorManager.whiteColor.withOpacity(0.5),
          alignment: AlignmentDirectional.centerStart,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          disabledHint: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(
              S.of(context)!.noData,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          value: selectedValue,
          onChanged: onChanged,
          items: items,
          validator: validatorFun ??
              (value) {
                if (isRequierd) {
                  return value == "" || value == null
                      ? "${title ?? ''} ${S.of(context)!.required}"
                      : null;
                }
                return null;
              },
          style: TextStyle(
            color: hintColor ?? ColorManager.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIconColor: ColorManager.hintColor,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 0,
            ),
            suffix: suffixWidget,
            filled: true,
            errorMaxLines: 3,
            suffixIconColor: ColorManager.blackColor,
            suffixStyle: TextStyle(
              color: ColorManager.blackColor.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            isDense: true,
            hintStyle: TextStyle(
              color: hintColor ?? ColorManager.offWhiteColor.withOpacity(.5),
              fontSize: hintsize?.sp ?? 14.sp,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: contentPadding,
            hintText: hintText,
            fillColor: fillColor ?? Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              borderSide:
                  BorderSide(color: ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              borderSide:
                  BorderSide(color: ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              borderSide:
                  BorderSide(color: ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              borderSide: const BorderSide(color: ColorManager.redColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              borderSide: const BorderSide(color: ColorManager.lightGrayColor),
            ),
          ),
        ),
      ],
    );
  }
}
