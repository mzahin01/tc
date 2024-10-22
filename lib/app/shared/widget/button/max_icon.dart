// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:maxlive/app/shared/model/icon_button_model.dart';
import 'package:maxlive/app/shared/widget/image/max_network_image.dart';
import 'package:maxlive/app/shared/widget/image/max_svg_image.dart';

/// Created by Abdullah on 6/10/24.

class MaxIcon extends StatelessWidget {
  final IconButtonModel iconData;
  final backgroundColor;
  final padding;
  final double? height;
  final double? width;
  final borderRadius;
  final isSvg;

  const MaxIcon(
      {super.key,
      required this.iconData,
      this.backgroundColor,
      this.padding,
      this.height,
      this.isSvg = true,
      this.width,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: backgroundColor, borderRadius: borderRadius),
      child: iconData.iconData != null
          ? Icon(
              iconData.iconData,
              size: height,
              color: iconData.color,
            )
          : iconData.localImage != null
              ? (isSvg!
                  ? MaxSvgImage.asset(
                      iconData.localImage!,
                      height: height,
                      width: width,
                      colorFilter: iconData.color != null
                          ? ColorFilter.mode(iconData.color!, BlendMode.srcIn)
                          : null,
                    )
                  : Image.asset(
                      iconData.localImage!,
                      height: height,
                      width: width,
                    ))
              : MaxNetworkImage(
                  imageUrl: iconData.networkIcon!,
                  height: height,
                  width: width,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_outlined),
                  placeholder: (context, url) =>
                      const Icon(Icons.image_outlined),
                ),
    );
  }
}
