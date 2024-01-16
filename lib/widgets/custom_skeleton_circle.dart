import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomSkeletonCircle extends StatelessWidget {
  final double minHeight;
  final double width;
  final double maxHeight;

  const CustomSkeletonCircle({super.key, required this.minHeight, required this.width, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SkeletonAvatar(
        style: SkeletonAvatarStyle(
          width: width,
          height: width,
          shape: BoxShape.circle,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
