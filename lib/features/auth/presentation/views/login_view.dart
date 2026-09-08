import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:noteflow/core/routes/app_router.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/utils/service_locator.dart';
import 'package:noteflow/core/widgets/custom_button.dart';
import 'package:noteflow/core/widgets/loading.dart';
import 'package:noteflow/core/widgets/snack.dart';
import 'package:noteflow/core/widgets/text_field.dart';
import 'package:noteflow/features/auth/domain/entities/login_user_entity.dart';
import 'package:noteflow/features/auth/domain/usecases/login_usecase.dart';
import 'package:noteflow/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:noteflow/features/auth/presentation/views/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> vali = GlobalKey();

  @override
  void initState() {
    emailController.text = 'ibrahom0780@gmail.com';
    passwordController.text = '07700770';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUseCase: getIt.get<LoginUsecase>()),

      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Directionality(
                textDirection: TextDirection.rtl, // لضمان اتجاه النص والتصميم
                child: Form(
                  key: vali,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.lock_person_rounded,
                        size: 80,
                        color: AppColors.primary,
                      ),
                      const Gap(24),
                      const Text(
                        'مرحباً بعودتك',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(8),
                      const Text(
                        'سجل الدخول للوصول إلى ملاحظاتك',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(32),
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
                      const Gap(32),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Snack.showSuccess(
                              context,
                              'تم تسجيل الدخول بنجاح',
                            );
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.rootView);
                          }
                          if (state is LoginFailure) {
                            Snack.showError(context, state.message);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return Loading();
                          }
                          return CustomButton(
                            title: "تسجيل الدخول",
                            onTap: () {
                              if (vali.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                  user: LoginUserEntity(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                      const Gap(16),
                      iDontHaveAccount(context),
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

  Row iDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ليس لديك حساب؟',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupView(),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
          ),
          child: const Text(
            'إنشاء حساب',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
