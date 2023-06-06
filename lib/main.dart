import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkul_interview/constant.dart';
import 'package:webkul_interview/controller/auth_controller.dart';
import 'package:webkul_interview/views/auth/login_Screen.dart';
import 'package:webkul_interview/views/auth/signUpScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => {
    Get.put(AuthController())
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Webkul InterView Process',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,

      ),
      home:  SignUpScreen(),
    );
  }
}