import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/utils/service_locator.dart';
import 'package:noteflow/core/widgets/custom_button.dart';
import 'package:noteflow/core/widgets/text_field.dart';
import 'package:noteflow/features/auth/domain/usecases/signup_usecase.dart';
import 'package:noteflow/features/auth/presentation/manager/sign_up/sign_up_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> vali = GlobalKey();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(signUpUseCase: getIt.get<SignupUsecase>()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            'إنشاء حساب',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.textPrimary),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: vali,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'انضم إلينا',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(8),
                      const Text(
                        'سجل الآن لتبدأ في حفظ أفكارك',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(32),

                      // استخدام الـ Widget المستقل هنا
                      CustomTextField(
                        controller: nameController,
                        label: 'الاسم الكامل',
                        icon: Icons.person_outline,
                      ),
                      const Gap(16),

                      CustomTextField(
                        controller: emailController,
                        label: 'البريد الإلكتروني',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Gap(16),

                      CustomTextField(
                        controller: passwordController,
                        label: 'كلمة المرور',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const Gap(16),

                      const Gap(32),
                      CustomButton(
                        title: 'إنشاء الحساب',
                        onTap: () {
                          if (vali.currentState!.validate()) {}
                        },
                      ),
                      const Gap(16),

                      haveAccount(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row haveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'لديك حساب بالفعل؟',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
          ),
          child: const Text(
            'تسجيل الدخول',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
