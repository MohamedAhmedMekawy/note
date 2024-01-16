import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomUploadFile extends StatelessWidget {
  final String text;
  const CustomUploadFile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .35.widthPercentage,
      height: .09.heightPercentage,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.radius),
        border: Border.all(
            color: ColorManager.offWhiteColor.withOpacity(.4), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.file_upload_outlined,
            color: ColorManager.offWhiteColor.withOpacity(.4),
          ),
          6.verticalSpace,
          CustomText(
            title: text,
            size: 14,
            align: TextAlign.center,
            maxLines: 2,
            fontWeight: FontWeight.normal,
            textOverflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
