import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/resource/color_manager.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final double? elevation;
  final String? title;
  final Widget? titleWidget;
  final double? titleSize;
  final VoidCallback? onLeadingTap;
  final Widget? leadingIcon;
  final List<Widget>? actionIcons;
  final double? leadingWidth;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.elevation,
    this.title,
    this.leadingWidth = 70,
    this.titleSize,
    this.titleWidget,
    this.leadingIcon,
    this.centerTitle = false,
    this.actionIcons,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: backgroundColor ?? ColorManager.scaffoldBGColor,
          statusBarBrightness: SystemUiOverlayStyle.light.statusBarBrightness,
        ),
        child: SafeArea(
          child: Container(
            color: backgroundColor ?? ColorManager.scaffoldBGColor,
            child: AppBar(
              backgroundColor: backgroundColor ?? ColorManager.scaffoldBGColor,
              elevation: elevation ?? 0.0,
              actions: actionIcons ?? [],
              // leading: leadingIcon ?? Container(),
              title: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 12,
                ),
                child: titleWidget ??
                    CustomText(
                      title: title ?? '',
                      size: titleSize?.sp ?? 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              centerTitle: centerTitle,
              leadingWidth: leadingWidth,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
