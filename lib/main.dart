import 'package:checkin/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/initial_bindings.dart';
import 'core/utils/logger.dart';
import 'localization/app_localization.dart';

void main() {




  // Hide status bar
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    await Firebase.initializeApp();

    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //
    //       statusBarColor: Colors.transparent,
    //     ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('ar', 'SA'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      title: 'lbl_bookings'.tr,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
