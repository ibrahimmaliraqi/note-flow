import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';

Future<dynamic> showSheet({
  required BuildContext context,
  required Widget widget,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.background,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24), // حواف علوية دائرية
      ),
    ),
    elevation: 2,
    builder: (context) {
      return widget;
    },
  );
}
