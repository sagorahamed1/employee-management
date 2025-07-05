
import 'package:droke/core/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {



  late final AnimationController _controller;


  @override
  void initState() {

    Future.delayed(Duration(seconds: 2), () {
      return Get.offAllNamed(AppRoutes.onboardingScreen);
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 307.h),


              Assets.images.logo.image(),

              CustomText(text: "Bringing neighbors together", fontSize: 22.h, bottom: 139.h),



              // Assets.lottie.loading.lottie(height: 60.h)

              RotationTransition(
                turns: _controller,
                child: Assets.images.circle.image(
                  width: 60.w,
                  height: 60.h,
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}