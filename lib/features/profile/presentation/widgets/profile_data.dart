import 'package:flutter/material.dart';
import 'package:noteflow/core/helper/time_ago_helper.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/profile/presentation/widgets/profile_info_row.dart';

class ProfileData extends StatelessWidget {
  final UserEntity user;
  const ProfileData({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // صورة المستخدم
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.inputFill,
            child: Icon(
              Icons.person_rounded,
              size: 50,
              color: AppColors.primary,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // اسم المستخدم
        CustomText(
          text: user.name,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),

        const SizedBox(height: 6),

        // البريد الإلكتروني
        CustomText(
          text: user.email,
          fontSize: 14,
          color: AppColors.textSecondary,
        ),

        const SizedBox(height: 40),

        // معلومات الحساب
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Column(
            children: [
              ProfileInfoRow(
                icon: Icons.person_outline_rounded,
                title: 'الاسم',
                value: user.name,
              ),

              const Divider(height: 28),

              ProfileInfoRow(
                icon: Icons.email_outlined,
                title: 'البريد الإلكتروني',
                value: user.email,
              ),

              const Divider(height: 28),

              ProfileInfoRow(
                icon: Icons.calendar_today_outlined,
                title: 'تاريخ إنشاء الحساب',
                value: TimeAgoHelper.format(
                  user.createAt ?? DateTime.now().toString(),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // تسجيل الخروج
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // تسجيل الخروج لاحقاً
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              foregroundColor: AppColors.error,
              side: const BorderSide(
                color: AppColors.error,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(
              Icons.logout_rounded,
            ),
            label: const CustomText(
              text: 'تسجيل الخروج',
              color: AppColors.error,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
