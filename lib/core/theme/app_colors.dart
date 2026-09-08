import 'package:flutter/material.dart';

class AppColors {
  // الألوان الرئيسية (Primary Colors)
  static const Color primary = Color(0xFF4F758B); // أزرق رمادي هادئ
  static const Color primaryLight = Color(0xFF7E9DAF);
  static const Color primaryDark = Color(0xFF2C4C5F);

  // ألوان الخلفيات والأسطح (Background & Surface)
  static const Color background = Color(
    0xFFF6F8F9,
  ); // رمادي فاتح جداً مائل للأزرق
  static const Color surface = Colors.white; // للبطاقات (Cards)

  // ألوان الحقول (Fields & Inputs)
  static const Color inputFill = Color(0xFFE8ECEF); // لون تعبئة حقول الإدخال
  static const Color border = Color(0xFFD1D8DD); // لون الحدود

  // ألوان النصوص (Typography)
  static const Color textPrimary = Color(0xFF2A3439); // رمادي داكن للعناوين
  static const Color textSecondary = Color(
    0xFF73828C,
  ); // رمادي فاتح للنصوص الفرعية

  // ألوان الحالات (Status Colors)
  static const Color error = Color(0xFFD9534F); // أحمر هادئ للحذف أو الأخطاء
  static const Color success = Color(0xFF4CAF50); // أخضر هادئ للنجاح
  static const Color warning = Color(0xFFFFB300); // أصفر هادئ للتنبيهات
}
