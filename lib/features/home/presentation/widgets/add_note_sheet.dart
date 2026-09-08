import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_button.dart';
import 'package:noteflow/core/widgets/custom_text.dart';
import 'package:noteflow/core/widgets/loading.dart';
import 'package:noteflow/core/widgets/snack.dart';
import 'package:noteflow/core/widgets/text_field.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/presentation/manager/add_note/add_note_cubit.dart';
import 'package:noteflow/features/home/presentation/manager/get_notes/get_notes_cubit.dart';
// import 'package:noteflow/core/widgets/custom_text_field.dart'; // إذا كنت تريد استخدام حقل الإدخال المخصص للعنوان

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> vali = GlobalKey();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        // هذه الخطوة مهمة جداً ليرتفع الـ Sheet مع الكيبورد
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24,
          right: 24,
          top: 24,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: vali,
            child: Column(
              mainAxisSize: MainAxisSize.min, // ليأخذ مساحة المحتوى فقط
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // مؤشر السحب (Drag Handle)
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                const CustomText(
                  text: 'إضافة ملاحظة جديدة',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // حقل العنوان
                CustomTextField(
                  label: 'عنوان الملاحظة',
                  icon: Icons.title_outlined,
                  controller: _titleController,
                ),
                const SizedBox(height: 16),

                // حقل المحتوى (متعدد الأسطر)
                CustomTextField(
                  label: 'اكتب تفاصيل ملاحظتك هنا...',
                  icon: Icons.note_alt_outlined,
                  maxLines: 5,
                  controller: _contentController,
                ),
                const SizedBox(height: 24),

                // زر الحفظ
                BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (context, state) {
                    if (state is AddNoteSuccess) {
                      GoRouter.of(context).pop();
                      Snack.showSuccess(context, state.message);
                    } else if (state is AddNoteFailure) {
                      Snack.showError(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddNoteLoading) {
                      return Loading();
                    }
                    return CustomButton(
                      title: 'حفظ الملاحظة',
                      onTap: () {
                        if (vali.currentState!.validate()) {
                          NoteEntity note = NoteEntity(
                            title: _titleController.text,
                            content: _contentController.text,
                            createAt: DateTime.now().toString(),
                          );
                          context.read<AddNoteCubit>().addNote(addNote: note);
                          context.read<GetNotesCubit>().getNotes();
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 24), // مسافة سفلية للأمان
              ],
            ),
          ),
        ),
      ),
    );
  }
}
