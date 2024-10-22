import 'package:flutter/material.dart';
import 'package:maxlive/app/shared/widget/button/bar_button.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class CooldownBarButton extends StatelessWidget {
  const CooldownBarButton({
    super.key,
    required this.title,
    required this.onTap,
    this.child,
    this.cooldownTime = const Duration(milliseconds: 500),
  });

  final String title;
  final Future<void> Function()? onTap;
  final Duration cooldownTime;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    return TapDebouncer(
      cooldown: cooldownTime,
      onTap: onTap,
      waitBuilder: (final _, final __) => BarButton.loader(),
      builder: (final context, final onTap) =>
          child ??
          BarButton(
            title: title,
            onPressed: onTap,
          ),
    );
  }
}
