import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/utils/showModalBottomSheet.dart';
import 'package:noteflow/core/widgets/custom_text.dart';
import 'package:noteflow/features/home/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:noteflow/features/home/presentation/widgets/add_note_sheet.dart';
import 'package:noteflow/features/home/presentation/widgets/not_list_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<GetNotesCubit>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const CustomText(
          text: 'ملاحظاتي',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.error),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              print("object");
              print(FirebaseAuth.instance.currentUser?.uid ?? "ماكو");
            },
          ),
        ],
      ),
      body: SafeArea(
        child: NotListBloc(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          print(PrefsHelper.getUser()!.id);
          showSheet(
            context: context,
            widget: AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
