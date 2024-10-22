import 'package:flutter/material.dart';
import 'package:maxlive/app/styles/colors.dart';
import 'package:maxlive/app/styles/spacing.dart';
import 'package:maxlive/app/styles/text_styles.dart';

class SimpleSplashTextButton extends StatelessWidget {
  const SimpleSplashTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.preIcon,
    this.showArrow = false,
  });
  final String text;
  final bool showArrow;
  final Widget? preIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: SGColors.white,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Spacing.xlarge2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (preIcon != null) ...<Widget>[
                const Spacer(),
                preIcon!,
                Spacing.sb8,
              ],
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyles.pro14w600.copyWith(
                  color: SGColors.black,
                ),
              ),
              const Spacer(),
              if (showArrow) ...<Widget>[
                const Icon(
                  Icons.chevron_right,
                  color: SGColors.blackShade3,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
