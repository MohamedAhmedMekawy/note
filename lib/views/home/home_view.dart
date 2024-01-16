import 'package:flutter/material.dart';
import 'package:notes_app/config/locale/i18n.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NotesAppView extends StatelessWidget {
  static const String routeName = '/';
  const NotesAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        titleWidget: CustomText(
          title: S.of(context)!.notes,
          color: ColorManager.whiteColor,
          fontWeight: FontWeight.w600,
        ),
        actionIcons: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: ColorManager.whiteColor.withOpacity(.04),
                borderRadius: BorderRadius.circular(12.radius),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          120.verticalSpace,
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: ColorManager.greenColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.radius))),
              child: Column(
                children: [
                  const ListTile(
                    tileColor: ColorManager.scaffoldBGColor,
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Mohamed',
                          color: ColorManager.whiteColor,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          title: 'Flutter Developer',
                          color: ColorManager.whiteColor,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: CustomText(
                      title: '2 ${S.of(context)!.notes}',
                      color: ColorManager.whiteColor,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
