import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import 'package:tutorai/routes/routes.dart';

void main() {
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
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
              primarySwatch: Colors.green,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              textTheme: TextTheme(
                  bodySmall: TextStyle(fontFamily: "Rubik Regular", color: const Color(0xFF7A869A), fontSize: 12.sp),
                  headlineLarge:
                      TextStyle(fontFamily: "Rubik Regular", color: const Color(0xFF172B4D), fontSize: 22.sp))),
        );
      },
    );
  }
}
