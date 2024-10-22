import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maxlive/app/styles/colors.dart';
import 'package:maxlive/app/styles/spacing.dart';
import 'package:maxlive/app/styles/text_styles.dart';

class TextArrowBarButton extends StatelessWidget {
  const TextArrowBarButton({
    super.key,
    required this.title,
    this.textStyle,
    this.textColor = SGColors.black,
    this.arrowColor = SGColors.black,
    this.splashColor = SGColors.blackShade2,
    this.height = 56,
    this.backgroundColor,
    this.border,
    this.withTopBorder = false,
    required this.onTap,
    this.asset,
  });
  final String? asset;
  final double height;
  final String title;
  final Color textColor;
  final Color arrowColor;
  final Color splashColor;
  final TextStyle? textStyle;
  final Function()? onTap;
  final Color? backgroundColor;
  final bool withTopBorder;
  final BoxBorder? border;

  BoxBorder get topBorder => const Border(
        top: BorderSide(color: SGColors.whiteShade2, width: 1),
      );

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? (withTopBorder ? topBorder : null),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.xlarge,
            vertical: 0,
          ),
          minimumSize: Size(double.maxFinite, height),
          foregroundColor: splashColor,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (asset != null) ...<Widget>[
                  SvgPicture.asset(
                    asset!,
                    height: 24,
                    width: 24,
                  ),
                  Spacing.sb4,
                ],
                Text(
                  title,
                  style: textStyle ??
                      TextStyles.pro14w600.copyWith(
                        color: textColor,
                      ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: arrowColor,
            ),
          ],
        ),
      ),
    );
  }
}
