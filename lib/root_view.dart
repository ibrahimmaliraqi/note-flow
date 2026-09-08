import 'package:flutter/material.dart';
import 'package:noteflow/core/theme/app_colors.dart';
import 'package:noteflow/features/home/presentation/views/home_view.dart';
import 'package:noteflow/features/profile/presentation/view/profile_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  // مؤشر الشاشة الحالية
  int _currentIndex = 0;

  // قائمة الشاشات
  final List<Widget> _views = const [
    HomeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      // استخدام NavigationBar الخاص بـ Material 3
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.background,
        indicatorColor: AppColors.primary.withOpacity(
          0.2,
        ), // لون خلفية الأيقونة المحددة
        elevation: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.home_rounded, color: AppColors.primary),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.person_rounded, color: AppColors.primary),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}
