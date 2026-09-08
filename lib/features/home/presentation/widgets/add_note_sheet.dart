import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_button.dart';
import 'package:noteflow/core/widgets/custom_text.dart';
import 'package:noteflow/core/widgets/text_field.dart';
// import 'package:noteflow/core/widgets/custom_text_field.dart'; // إذا كنت تريد استخدام حقل الإدخال المخصص للعنوان

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
              CustomButton(title: 'حفظ الملاحظة'),
              const SizedBox(height: 24), // مسافة سفلية للأمان
            ],
          ),
        ),
      ),
    );
  }
}
