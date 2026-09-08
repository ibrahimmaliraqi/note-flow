import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border), // حدود خفيفة وأنيقة
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'أفكار تطبيق فلاتر',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                maxLines: 1, // إخفاء النص الزائد بعنوان الملاحظة
              ),
              const SizedBox(height: 8),
              CustomText(
                text:
                    'احتاج لتصميم واجهات نظيفة واستخدام Cubit لإدارة الحالة لتطبيق الملاحظات.',
                fontSize: 14,
                color: AppColors.textSecondary,
                maxLines: 2, // عرض سطرين فقط من المحتوى
              ),
              const Gap(8),
              Align(
                alignment: Alignment.bottomLeft,
                child: CustomText(
                  text: "منذ ساعتين",
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
