import 'package:flutter/material.dart';
import 'package:maxlive/app/styles/colors.dart';
import 'package:maxlive/app/styles/spacing.dart';
import 'package:maxlive/app/styles/text_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.title,
    this.textStyle,
    this.height = 48,
    this.onPressed,
    this.backgroundColor,
    this.radius,
    this.padding,
  });
  final String title;
  final TextStyle? textStyle;
  final double height;
  final Function()? onPressed;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: Spacing.xlarge),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? SGColors.blue,
          borderRadius: radius ?? BorderRadius.circular(8),
        ),
        height: height,
        width: double.maxFinite,
        child: RawMaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: textStyle ??
                TextStyles.pro16w600.copyWith(color: SGColors.white),
          ),
        ),
      ),
    );
  }
}
