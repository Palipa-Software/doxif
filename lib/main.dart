import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorai/firebase_options.dart';

import 'package:tutorai/routes/routes.dart';
import 'package:tutorai/shared/constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
              bodySmall: TextStyle(fontFamily: "Rubik Regular", color: const Color(0xFF7A869A), fontSize: 12.sp),
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
