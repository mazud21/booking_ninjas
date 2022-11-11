import 'package:booking_ninjas/view/history.dart';
import 'package:booking_ninjas/view/login.dart';
import 'package:booking_ninjas/view/login_signup.dart';
import 'package:booking_ninjas/view/tasks.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../test/test.dart';
import '../view/account_verification.dart';
import '../view/current_task.dart';
import '../view/forgot_password.dart';
import '../view/new_password.dart';
import '../view/password_reset.dart';
import '../view/password_update_successful.dart';
import '../view/user.dart';
import '../view/verification_successful.dart';

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
      page: () => const CurrentTask(getSecond: 0,),
      //binding: DataBindings(),
    ),

  ];
}