import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noteflow/core/routes/app_router.dart';
import 'package:noteflow/core/theme/app_theme.dart';

void main() {
  runApp(const Noteflow());
}

class Noteflow extends StatelessWidget {
  const Noteflow({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      locale: Locale("ar"),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
    );
  }
}
