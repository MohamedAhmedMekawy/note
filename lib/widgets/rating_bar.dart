import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomRatingBar extends StatelessWidget {
  final int itemCount;
  final bool top;
  final bool enable;
  final dynamic averageRating;
  final bool showText;
  final bool? allowHalfRating;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? unratedColor;
  final Color? textColor;
  final Color? textColorRate;
  final double? itemSize;
  final double minRate;
  final Function(double rate)? currentRate;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomRatingBar({
    this.itemCount = 5,
    required this.averageRating,
    this.top = false,
    this.enable = false,
    this.showText = true,
    this.itemSize,
    this.minRate = 0.5,
    this.primaryColor,
    this.secondaryColor,
    this.unratedColor,
    this.textColor,
    this.textColorRate,
    this.currentRate,
    this.mainAxisAlignment,
    super.key,
    this.allowHalfRating,
  });

  @override
  Widget build(BuildContext context) {
    // print('averageRating ${double.parse('${averageRating ?? 0}')}');
    return Column(
      children: [
        if (top)
          CustomText(
            title: '$averageRating',
            size: 14,
            fontWeight: FontWeight.normal,
          ),
        Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            RatingBar.builder(
              maxRating: 4000,
              minRating: 0,
              ignoreGestures: !enable,
              itemSize: itemSize ?? 20.w,
              initialRating:
                  double.parse('${averageRating ?? 0}').roundToDouble(),
              direction: Axis.horizontal,
              allowHalfRating: allowHalfRating ?? false,
              itemCount: itemCount,
              itemPadding: const EdgeInsets.symmetric(horizontal: .5),
              unratedColor: unratedColor ?? const Color(0xffECEFF1),
              glow: false,
              itemBuilder: (context, _) => Icon(
                Icons.star_purple500_outlined,
                color: primaryColor ?? const Color(0xffF7C900),
              ),
              onRatingUpdate: (rating) {
                currentRate == null ? null : currentRate!(rating);
              },
            ),
            4.horizontalSpace,
            if (top == false)
              if (showText)
                CustomText(
                  title:
                      '(${double.parse('${averageRating ?? 0}').roundToDouble()})',
                  size: 12,
                  color: textColor ?? ColorManager.whiteColor,
                ),
          ],
        ),
      ],
    );
  }
}
