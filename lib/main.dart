import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/core/config/light_themes.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/screens/splash/splash_screen.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
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
        return GetMaterialApp(
          title: 'Droke',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          getPages: AppRoutes.routes,
          theme: light(),
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}


