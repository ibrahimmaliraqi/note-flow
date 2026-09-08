import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/core/widgets/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // قائمة وهمية لاختبار التصميم (قم بإفراغ القائمة [] لرؤية حالة الـ Empty State)
  final List<Map<String, String>> dummyNotes = [
    {
      'title': 'أفكار تطبيق فلاتر',
      'content':
          'احتاج لتصميم واجهات نظيفة واستخدام Cubit لإدارة الحالة لتطبيق الملاحظات.',
    },
    {
      'title': 'مشتريات اليوم',
      'content': 'حليب، خبز، قهوة، وتجديد اشتراك الإنترنت قبل نهاية الأسبوع.',
    },
    {
      'title': 'ملاحظة سريعة',
      'content': 'لا تنسَ مراجعة كود Firebase اليوم مساءً.',
    },
  ];

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
        // نتحقق مما إذا كانت القائمة فارغة لعرض التصميم المناسب
        child: dummyNotes.isEmpty ? _buildEmptyState() : _buildNotesList(),
      ),
      // زر الإضافة العائم
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(PrefsHelper.getUser()!.email);
          print(PrefsHelper.getUser()!.id);
          print(PrefsHelper.getUser()!.name);
          print(PrefsHelper.getUser()!.createAt);
          print(PrefsHelper.getUser()!.image);
        },
        backgroundColor: AppColors.primary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  // 1. واجهة حالة الفراغ (Empty State)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.speaker_notes_off_rounded,
            size: 80,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const CustomText(
            text: 'لا توجد ملاحظات بعد',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          const SizedBox(height: 8),
          const CustomText(
            text: 'اضغط على زر (+) بالأسفل لإضافة ملاحظتك الأولى',
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  // 2. واجهة قائمة الملاحظات (Notes List)
  Widget _buildNotesList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: dummyNotes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final note = dummyNotes[index];
        return _buildNoteCard(note);
      },
    );
  }

  // 3. تصميم بطاقة الملاحظة (Note Card) - يمكن فصلها في ملف مستقل لاحقاً
  Widget _buildNoteCard(Map<String, String> note) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border), // حدود خفيفة وأنيقة
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // سيتم الانتقال لشاشة تعديل الملاحظة هنا
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: note['title'] ?? '',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                maxLines: 1, // إخفاء النص الزائد بعنوان الملاحظة
              ),
              const SizedBox(height: 8),
              CustomText(
                text: note['content'] ?? '',
                fontSize: 14,
                color: AppColors.textSecondary,
                maxLines: 2, // عرض سطرين فقط من المحتوى
              ),
            ],
          ),
        ),
      ),
    );
  }
}
