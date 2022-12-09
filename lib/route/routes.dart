import 'package:booking_ninjas/view/main_pages/history.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../test/test_getx_infinity_scroll.dart';
import '../view/account_pages/account_verification.dart';
import '../view/account_pages/login.dart';
import '../view/account_pages/login_signup.dart';
import '../view/account_pages/new_password.dart';
import '../view/account_pages/password_reset.dart';
import '../view/account_pages/password_update_successful.dart';
import '../view/account_pages/verification_successful.dart';
import '../view/current_task.dart';
import '../view/account_pages/forgot_password.dart';
import '../view/main_pages/tasks.dart';

class Routes{

  static final routes = [

    GetPage(
      name: '/homePage',
      page: () => MyHomePage(title: 'title'),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/loginSignUp',
      page: () => LoginSignUp(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/accountVerification',
      page: () => AccountVerification(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/verificationSuccessful',
      page: () => VerificationSuccessful(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => ForgotPassword(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/passwordReset',
      page: () => PasswordReset(),
      //binding: DataBindings(),
    ),
    GetPage(
      name: '/newPassword',
      page: () => NewPassword(),
      //binding: DataBindings(),
    ),GetPage(
      name: '/passwordUpdateSuccessful',
      page: () => PasswordUpdateSuccessful(),
      //binding: DataBindings(),
    ),GetPage(
      name: '/history',
      page: () => History(),
      //binding: DataBindings(),
    ),GetPage(
      name: '/tasks',
      page: () => Tasks(),
      //binding: DataBindings(),
    ),GetPage(
      name: '/currentTask',
      page: () => CurrentTask(),
      //binding: DataBindings(),
    ),

  ];
}