import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/core/routes/app_router.dart';
import 'package:noteflow/core/theme/app_theme.dart';
import 'package:noteflow/core/utils/service_locator.dart';
import 'package:noteflow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PrefsHelper.init();
  setupLocator();
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
