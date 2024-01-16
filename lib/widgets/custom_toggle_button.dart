import 'package:flutter/material.dart';
import 'package:notes_app/resource/color_manager.dart';

class CustomSwitch extends StatefulWidget {
  final Color? inactiveColor;
  final Color? activeColor;
  final dynamic value;
  final Function onToggle;
  final double? width;
  final double? height;
  final String? title;
  const CustomSwitch({
    super.key,
    this.inactiveColor,
    this.activeColor,
    this.value,
    required this.onToggle,
    this.width,
    this.height,
    this.title,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onToggle(true)
                : widget.onToggle(false);
          },
          child: Container(
            width: 60.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                  color: widget.value
                      ? ColorManager.yellowColor
                      : ColorManager.whiteColor.withOpacity(.4),
                  width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.value
                          ? ColorManager.yellowColor
                          : ColorManager.whiteColor
                              .withOpacity(.4)
                              .withOpacity(.4)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
