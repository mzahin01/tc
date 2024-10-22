// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:maxlive/app/shared/model/icon_button_model.dart';

import 'max_icon.dart';

class MaxIconButton extends StatelessWidget {
  final IconButtonModel iconData;
  final Color? backgroundColor;
  final onPress;
  final double height, width;
  final EdgeInsets? margin;
  final isSvg;
  final isSelected;
  final EdgeInsets? padding;
  final EdgeInsets? titlePadding;
  final Axis direction;
  final textStyle;
  final BorderRadiusGeometry? borderRadius;

  MaxIconButton(
      {super.key,
      required this.iconData,
      this.backgroundColor,
      required this.onPress,
      this.height = 40,
      this.width = 40,
      this.isSelected = false,
      this.isSvg = true,
      this.borderRadius = const BorderRadius.all(Radius.circular(10)),
      this.margin,
      this.titlePadding,
      this.direction = Axis.vertical,
      this.padding,
      this.textStyle})
      : assert(
            iconData.iconData != null ||
                iconData.localImage != null ||
                iconData.networkIcon != null,
            "iconData , localImage or networkImage , can't be null at the same time");

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: const VisualDensity(),
      onPressed: () {
        onPress(iconData);
      },
      padding: EdgeInsets.zero,
      icon: Container(
        margin: margin,
        child: Wrap(
          direction: direction,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )
                    : Border.all(
                        color: Colors.transparent,
                      ),
              ),
              child: MaxIcon(
                iconData: iconData,
                padding: padding,
                height: height,
                width: width,
                isSvg: isSvg,
                borderRadius: borderRadius,
                backgroundColor: backgroundColor,
              ),
            ),
            if (iconData.title != null)
              Container(
                padding: titlePadding ?? EdgeInsets.zero,
                child: Text(
                  iconData.title ?? '',
                  maxLines: 2,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              )
          ],
        ),
      ),
    );
  }
}
