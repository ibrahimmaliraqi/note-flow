import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // مؤقتاً، لاحقاً نجيبها من Firebase
    const String name = 'إبراهيم محمد';
    const String email = 'ibrahim@example.com';
    const String createdAt = '8 سبتمبر 2026';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const CustomText(
          text: 'حسابي',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
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
              const CustomText(
                text: name,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: 6),

              // البريد الإلكتروني
              const CustomText(
                text: email,
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
                    _buildInfoRow(
                      icon: Icons.person_outline_rounded,
                      title: 'الاسم',
                      value: name,
                    ),

                    const Divider(height: 28),

                    _buildInfoRow(
                      icon: Icons.email_outlined,
                      title: 'البريد الإلكتروني',
                      value: email,
                    ),

                    const Divider(height: 28),

                    _buildInfoRow(
                      icon: Icons.calendar_today_outlined,
                      title: 'تاريخ إنشاء الحساب',
                      value: createdAt,
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
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
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
