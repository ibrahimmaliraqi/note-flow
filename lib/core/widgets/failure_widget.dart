import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'custom_text.dart'; // تأكد من مسار الاستدعاء الصحيح

class FailureWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const FailureWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // أيقونة الخطأ
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.error,
              size: 80,
            ),
            const SizedBox(height: 16),

            // رسالة الخطأ
            CustomText(
              text: message,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              // color: AppColors.textPrimary, // سيأخذ اللون الافتراضي من CustomText
            ),
            const SizedBox(height: 8),

            // نص فرعي إضافي
            const CustomText(
              text: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.',
              fontSize: 14,
              color: AppColors.textSecondary,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // زر إعادة المحاولة (يظهر فقط إذا تم تمرير onRetry)
            if (onRetry != null)
              SizedBox(
                width: 200, // عرض محدد للزر ليكون شكله متناسقاً
                child: FilledButton.icon(
                  onPressed: onRetry,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const CustomText(
                    text: 'إعادة المحاولة',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
