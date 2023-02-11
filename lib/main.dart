import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/colors.dart';

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
            scaffoldBackgroundColor: AppColors.bgColor,
            primarySwatch: Colors.green,
            hintColor: AppColors.addPhoto,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.arrowBack,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: AppColors.black,
                fontFamily: "Rubik Bold",
                fontSize: 10.8.sp,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        );
      },
    );
  }
}
