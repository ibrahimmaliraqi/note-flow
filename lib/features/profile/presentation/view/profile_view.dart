import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/utils/service_locator.dart';
import 'package:noteflow/core/widgets/custom_text.dart';
import 'package:noteflow/core/widgets/failure_widget.dart';
import 'package:noteflow/features/auth/domain/entities/user_entity.dart';
import 'package:noteflow/features/profile/domain/usecases/get_prfile_data_usecase.dart';
import 'package:noteflow/features/profile/presentation/manager/get_profile_data/get_profile_data_cubit.dart';
import 'package:noteflow/features/profile/presentation/widgets/profile_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProfileDataCubit(
        getProfileDataUsecase: getIt.get<GetProfileDataUsecase>(),
      )..getProfileData(userId: PrefsHelper.getUser()!.id),
      child: Scaffold(
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
            child: BlocBuilder<GetProfileDataCubit, GetProfileDataState>(
              builder: (context, state) {
                if (state is GetProfileDataLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: ProfileData(
                      user: UserEntity(
                        id: '',
                        name: 'جاري التحميل...',
                        email: 'جاري التحميل...',
                      ),
                    ),
                  );
                } else if (state is GetProfileDataFailure) {
                  return FailureWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<GetProfileDataCubit>().getProfileData(
                        userId: PrefsHelper.getUser()!.id,
                      );
                    },
                  );
                } else if (state is GetProfileDataSuccess) {
                  return ProfileData(user: state.user);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
