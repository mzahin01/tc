import 'package:flutter/material.dart';
import 'package:maxlive/app/shared/model/icon_button_model.dart';
import 'package:maxlive/app/styles/colors.dart';
import 'max_icon.dart';

class MaxCircleButton extends StatelessWidget {
  final IconButtonModel iconData;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  final double size; // Set one size for both width and height
  final EdgeInsets? margin;
  final bool isSvg;
  final bool isSelected;
  final EdgeInsets? iconPadding;
  final EdgeInsets? titlePadding;
  final Axis direction;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;

  MaxCircleButton({
    super.key,
    required this.iconData,
    this.backgroundColor,
    required this.onPress,
    this.size = 45, // Single size for circular shape
    this.isSelected = false,
    this.isSvg = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(60)),
    this.margin,
    this.titlePadding,
    this.direction = Axis.vertical,
    this.iconPadding,
    this.textStyle,
  }) : assert(
            iconData.iconData != null ||
                iconData.localImage != null ||
                iconData.networkIcon != null,
            "iconData , localImage or networkImage , can't be null at the same time");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: margin,
        child: Column(
          // Replaced Wrap with Column for a better vertical layout
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: size,
                height: size,
                color: backgroundColor ?? SGColors.black.withOpacity(0.5),
                child: Center(
                  child: MaxIcon(
                    iconData: iconData,
                    padding: iconPadding,
                    height: size,
                    width: size,
                    isSvg: isSvg,
                  ),
                ),
              ),
            ),
            if (iconData.title != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: titlePadding ?? EdgeInsets.zero,
                child: Text(
                  iconData.title ?? '',
                  maxLines: 2,
                  style: textStyle ??
                      const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
