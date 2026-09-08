import 'package:noteflow/features/home/domain/entities/note_entity.dart';

final List<NoteEntity> demoNotes = [
  NoteEntity(
    title: 'أفكار تطبيق فلاتر',
    content: 'أحتاج لتصميم واجهات نظيفة واستخدام Cubit لإدارة الحالة.',
    createAt: '2026-09-08 14:30:25',
  ),
  NoteEntity(
    title: 'تعلم Firebase',
    content: 'مراجعة Firestore و Firebase Authentication وربطهما بالتطبيق.',
    createAt: '2026-09-08 13:15:42',
  ),
  NoteEntity(
    title: 'مهام اليوم',
    content: 'إكمال صفحة الملاحظات وإضافة ميزة حذف وتعديل الملاحظة.',
    createAt: '2026-09-08 11:45:18',
  ),
  NoteEntity(
    title: 'ملاحظات مهمة',
    content: 'استخدام Clean Architecture وترتيب المشروع بشكل منظم.',
    createAt: '2026-09-07 20:10:33',
  ),
  NoteEntity(
    title: 'أفكار مستقبلية',
    content: 'إضافة البحث عن الملاحظات وترتيبها حسب تاريخ الإنشاء.',
    createAt: '2026-09-07 18:25:51',
  ),
];
