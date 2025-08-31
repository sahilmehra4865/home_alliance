import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_dimension.dart';
import '../utils/app_images.dart';

class ImageView extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final File? file;
  final bool? circleCrop;
  final BoxFit? fit;
  final Color? color;
  final double? radius;

  const ImageView({
    Key? key,
    this.path,
    this.width,
    this.height,
    this.file,
    this.circleCrop = false,
    this.fit,
    this.radius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (path == "https://placekitten.com/200/300" || path == "") {
      imageWidget = Image.asset(
        AppImages.icEmptyProfile,
        width: width,
        height: height,
        //color: Theme.of(context).primaryColor,
        fit: BoxFit.contain,
      );
    } else if (path?.startsWith('http') ?? false) {
      imageWidget = CachedNetworkImage(
        fit: fit,
        height: height,
        width: width,
        imageUrl: path!,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    } else if (path?.startsWith(AppImages.assetsPath) ?? false) {
      imageWidget = path!.contains(".svg")
          ? SvgPicture.asset(
              path!,
              width: width,
              height: height,
              colorFilter: color != null
                  ? ColorFilter.mode(
                      color!,
                      BlendMode.srcIn,
                    ) // apply color if provided
                  : null, // no filter if color is null
            )
          : Image.asset(
              path!,
              width: width,
              height: height,
              fit: fit,
              color: color,
            );
    } else if (file != null) {
      imageWidget = Image.file(file!, width: width, height: height, fit: fit);
    } else {
      imageWidget = Image.file(
        File(path!),
        width: width,
        height: height,
        fit: fit,
      );
    }
    return circleCrop!
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? AppDimensions.d100.r),
            child: imageWidget,
          )
        : imageWidget;
  }
}
