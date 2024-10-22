import 'package:flutter/material.dart';
import 'package:maxlive/app/styles/colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    this.textStyle,
    this.height = 40,
    this.width = 40,
    this.onPressed,
    this.color,
    this.radius,
    this.padding,
  });
  final Widget icon;
  final TextStyle? textStyle;
  final double height, width;
  final Function()? onPressed;
  final BorderRadius? radius;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? SGColors.white,
          borderRadius: radius ?? BorderRadius.circular(4),
        ),
        height: height,
        width: width,
        child: RawMaterialButton(
          onPressed: onPressed,
          hoverColor: SGColors.blue.withOpacity(0.15),
          highlightColor: SGColors.blue.withOpacity(0.20),
          splashColor: SGColors.blue.withOpacity(0.10),
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(4),
          ),
          highlightElevation: 1,
          hoverElevation: 1,
          child: icon,
        ),
      ),
    );
  }
}
