import 'package:get/get.dart';
import 'package:tutorai/modules/login/login_binding.dart';
import 'package:tutorai/modules/login/login_screen.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
