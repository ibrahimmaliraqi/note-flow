import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart'; // مسار الـ CustomText

enum SnackbarType { success, error, warning, info }

class Snack {
  static void show(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
  }) {
    // تحديد اللون والأيقونة بناءً على نوع الرسالة
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = AppColors.success;
        icon = Icons.check_circle_outline_rounded;
        break;
      case SnackbarType.error:
        backgroundColor = AppColors.error;
        icon = Icons.error_outline_rounded;
        break;
      case SnackbarType.warning:
        backgroundColor = AppColors.warning;
        icon = Icons.warning_amber_rounded;
        break;
      case SnackbarType.info:
        backgroundColor = AppColors.primary;
        icon = Icons.info_outline_rounded;
        break;
    }

    // إغلاق أي SnackBar مفتوح حالياً لتجنب التكدس
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // عرض الـ SnackBar الجديد
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior:
            SnackBarBehavior.floating, // يجعله يطفو ولا يلتصق بأسفل الشاشة
        margin: const EdgeInsets.all(16), // مسافة من الحواف
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ), // حواف دائرية تتناسب مع تصميمنا
        ),
        duration: const Duration(seconds: 3), // مدة العرض
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: CustomText(
                text: message,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                maxLines: 2, // في حال كانت الرسالة طويلة
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دوال اختصار (Shortcuts) لسهولة الاستخدام أكثر

  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: SnackbarType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, type: SnackbarType.error);
  }

  static void showWarning(BuildContext context, String message) {
    show(context, message: message, type: SnackbarType.warning);
  }
}
