import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      // إذا تم تحديد maxLines، نجعل النص الزائد يظهر كنقاط (...) الافتراضية
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        // إذا لم تمرر لوناً، سيأخذ اللون الأساسي للنصوص تلقائياً
        color: color ?? AppColors.textPrimary,
        height: height,
        // fontFamily: 'Tajawal', // لا تحتاجها إذا كنت قد عرفت الخط في الـ Theme الرئيسي
      ),
    );
  }
}
