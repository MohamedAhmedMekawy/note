import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/config/locale/i18n.dart';
import 'package:notes_app/resource/assets_manager.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomNoDataWidget extends StatelessWidget {
  final String? msg;

  const CustomNoDataWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            ImageAssets.logo,
            height: 100.w,
            width: 100.w,
            color: ColorManager.yellowColor,
          ),
        ),
        CustomText(
          title: msg ?? S.of(context)!.noDataAdded,
          size: 20,
          color: ColorManager.offWhiteColor,
          align: TextAlign.center,
        ).allPadding(20)
      ],
    );
  }
}
