import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/resource/assets_manager.dart';
import 'package:notes_app/services/api/end_points.dart';
import 'package:notes_app/utils/app_utils/extentions.dart';
import 'package:notes_app/widgets/custom_skeleton_square.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? assestPath;
  final BoxFit boxFit;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool isImageAsset;
  final Color? color;
  final BlendMode? blendMode;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.isImageAsset = false,
    this.boxFit = BoxFit.cover,
    this.color,
    this.blendMode,
    this.assestPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: isImageAsset
          ? Image.asset(
              assestPath ?? ImageAssets.welcomeSvg,
              width: width ?? 1.widthPercentage * .35,
              height: height ?? 1.heightPercentage * .15,
              color: color,
              colorBlendMode: blendMode,
              fit: boxFit,
            )
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: '${EndPoints.imageBaseUrl}$imageUrl',
              alignment: Alignment.topCenter,
              width: width ?? 1.widthPercentage * .35,
              height: height ?? 1.heightPercentage * .15,
              color: color,
              colorBlendMode: blendMode,
              placeholder: (context, url) => CustomSkeletonSquare(
                width: width ?? 1.widthPercentage * .35,
                height: height ?? 1.heightPercentage * .15,
                borderRadius: borderRadius ?? 10,
                padding: 0,
              ),
              errorWidget: (context, url, error) => Image.asset(
                ImageAssets.welcomeSvg,
                width: width ?? 1.widthPercentage * .35,
                height: height ?? 1.heightPercentage * .15,
                color: color,
                colorBlendMode: blendMode,
                fit: boxFit,
              ),
            ),
    );
  }
}
