import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart';

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 13,
                color: AppColors.textSecondary,
              ),

              const SizedBox(height: 4),

              CustomText(
                text: value,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
