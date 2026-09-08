part of 'get_profile_data_cubit.dart';

@immutable
sealed class GetProfileDataState {}

final class GetProfileDataInitial extends GetProfileDataState {}

final class GetProfileDataSuccess extends GetProfileDataState {
  final UserEntity user;

  GetProfileDataSuccess({required this.user});
}

final class GetProfileDataFailure extends GetProfileDataState {
  final String message;

  GetProfileDataFailure({required this.message});
}

final class GetProfileDataLoading extends GetProfileDataState {}
