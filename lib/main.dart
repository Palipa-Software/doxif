// ignore_for_file: constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:seramcepte/firebase_options.dart';
import 'package:seramcepte/routes/routes.dart';
import 'package:seramcepte/shared/constants/colors.dart';

final FlutterLocalization localization = FlutterLocalization.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  localization.init(
    mapLocales: [
      const MapLocale('tr', AppLocale.TR),
    ],
    initLanguageCode: 'tr',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'SeramCepte',
          localizationsDelegates: localization.localizationsDelegates,
          supportedLocales: localization.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            primarySwatch: Colors.green,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              iconTheme: IconThemeData(
                color: AppColors.arrowBack,
              ),
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: AppColors.black,
                fontFamily: "Rubik Bold",
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            textTheme: TextTheme(
              bodySmall: TextStyle(
                  fontFamily: "Rubik Regular",
                  color: const Color(0xFF7A869A),
                  fontSize: 12.sp),
              headlineLarge: TextStyle(
                fontFamily: "Rubik Regular",
                color: const Color(0xFF172B4D),
                fontSize: 22.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> TR = {title: 'Lokalizasyon'};
}
