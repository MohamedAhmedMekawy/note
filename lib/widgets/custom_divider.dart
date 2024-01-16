import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const CustomDivider({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.4.w,
      width: width ?? double.infinity,
      color: color ?? ColorManager.lightGrayColor,
    );
  }
}
