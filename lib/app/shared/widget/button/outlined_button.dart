import 'package:flutter/material.dart';
import 'package:maxlive/app/styles/colors.dart';
import 'package:maxlive/app/styles/spacing.dart';
import 'package:maxlive/app/styles/text_styles.dart';

class PAOutlinedButton extends StatelessWidget {
  const PAOutlinedButton({
    super.key,
    required this.title,
    this.icon,
    this.textStyle,
    this.height = 48,
    this.width,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.padding,
    this.borderWidth = 1,
  });

  factory PAOutlinedButton.social({
    required final String title,
    required final Widget icon,
    final Function()? onPressed,
    final double borderWidth = 1,
  }) {
    return PAOutlinedButton(
      title: title,
      icon: icon,
      onPressed: onPressed,
      borderWidth: borderWidth,
    );
  }

  factory PAOutlinedButton.general({
    required final String title,
    final Function()? onPressed,
    final EdgeInsets? padding,
    final TextStyle? textStyle,
    final Color? backgroundColor,
    final Color? borderColor,
    final Widget? icon,
    final double borderWidth = 1,
  }) {
    return PAOutlinedButton(
      title: title,
      onPressed: onPressed,
      padding: padding,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      icon: icon,
      borderWidth: borderWidth,
    );
  }

  factory PAOutlinedButton.selectable({
    required final String title,
    final Function()? onPressed,
    final EdgeInsets? padding,
    final TextStyle? textStyle,
    final Color? backgroundColor,
    final Color? borderColor,
    final Widget? icon,
    final double borderWidth = 1,
    final bool isSelected = false,
  }) {
    return PAOutlinedButton(
      title: title,
      onPressed: onPressed,
      padding: padding,
      textStyle: textStyle,
      backgroundColor:
          isSelected ? SGColors.blue.withOpacity(0.1) : backgroundColor,
      borderColor: isSelected ? SGColors.blue : borderColor,
      icon: icon,
      borderWidth: isSelected ? 2 : borderWidth,
    );
  }

  final String title;
  final Widget? icon;
  final TextStyle? textStyle;
  final double? height, width;
  final double borderWidth;
  final Function()? onPressed;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
      height: height,
      width: width,
      child: icon == null
          ? TextButton(
              style: TextButton.styleFrom(
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: Spacing.xlarge),
                shape: RoundedRectangleBorder(
                  borderRadius: radius ?? BorderRadius.circular(8),
                  side: BorderSide(
                    color: borderColor ?? SGColors.whiteShade3,
                    width: borderWidth,
                  ),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                title,
                style: textStyle ??
                    TextStyles.pro14w600.copyWith(color: SGColors.black),
              ),
            )
          : TextButton.icon(
              style: TextButton.styleFrom(
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: Spacing.xlarge),
                shape: RoundedRectangleBorder(
                  borderRadius: radius ?? BorderRadius.circular(8),
                  side: BorderSide(
                    color: borderColor ?? SGColors.whiteShade3,
                  ),
                ),
              ),
              onPressed: onPressed,
              label: Text(
                title,
                style: textStyle ??
                    TextStyles.pro14w600.copyWith(color: SGColors.black),
              ),
              icon: icon!,
            ),
    );
  }
}
