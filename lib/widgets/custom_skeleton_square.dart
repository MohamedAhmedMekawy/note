import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomSkeletonSquare extends StatelessWidget {
  final double height;
  final double width;
  final double? borderRadius;
  final double? padding;

  const CustomSkeletonSquare({super.key, required this.height, required this.width, this.borderRadius = 5, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 10),
      child: SkeletonTheme(
        shimmerGradient: const LinearGradient(
          colors: [
            Color(0xFFFFFAFA),
            Color(0xFFEBE0DF),
            Color(0xFFFFFAFA),
          ],
          stops: [
            0.3,
            0.5,
            0.7,
          ],
          begin: Alignment(-2.4, -0.0),
          end: Alignment(2.4, 0.0),
          tileMode: TileMode.clamp,
        ),
        darkShimmerGradient: const LinearGradient(
          colors: [
            Color(0xFFFFFAFA),
            Color(0xFFEBE0DF),
            Color(0xFFFFFAFA),
          ],
          stops: [
            0.3,
            0.5,
            0.7,
          ],
          begin: Alignment(-2.4, -0.0),
          end: Alignment(2.4, 0.0),
          tileMode: TileMode.clamp,
        ),
        child: SkeletonLine(
          style: SkeletonLineStyle(
            height: height,
            width: width,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
      ),
    );
  }
}
