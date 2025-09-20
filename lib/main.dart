import 'package:droke/core/config/app_route.dart';
import 'package:droke/core/config/light_themes.dart';
import 'package:droke/views/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import 'helper/dependency_Injection.dart';

void main() {


  DependencyInjection().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return ToastificationWrapper(
          child: GetMaterialApp(
            title: 'Droke',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            getPages: AppRoutes.routes,
            theme: light(),
            themeMode: ThemeMode.light,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}


