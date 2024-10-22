import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxlive/app/shared/widget/bottom_sheet/bottom_sheet_util.dart';

class ConfirmationPopScope extends StatelessWidget {
  const ConfirmationPopScope({
    super.key,
    required this.child,
    this.canPop = false,
    this.onPopConfirmed,
  });
  final Widget child;
  final bool canPop;
  final VoidCallback? onPopConfirmed;

  @override
  Widget build(final BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (final bool isPopped) {
        if (isPopped) {
          return;
        }
        BottomSheetUtil.to.showYesNo(
          title: '',
          description: '',
          isDangerAction: true,
          positiveCallback:
              onPopConfirmed ?? () => Get.until((final route) => route.isFirst),
          positiveTitle: '',
          negativeTitle: '',
        );
      },
      child: child,
    );
  }
}
