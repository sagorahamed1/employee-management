import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        color: AppColors.textColorSecondary5EAAA8,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    );



    final List<PageViewModel> pages = [
      PageViewModel(
        title: "Join your Neighbors",
        body: "",
        image: Assets.images.onboarding1.image(),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Share tasks, Save time.",
        body: "",
        image: Assets.images.onboarding2.image(),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Track progress easily.",
        body: "",
        image: Assets.images.onboarding3.image(),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Welcome to NeighborHubs",
        body: "",
        image: Assets.images.onboarding4.image(),
        decoration: pageDecoration,
      ),
    ];


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: Column(
            children: [
        
              Assets.images.logo.image(),
        
        
        
              SizedBox(height: 95.h),
        
        
              // TODO: <<<==========Slider Section=========>>>
        
              Expanded(
                child: IntroductionScreen(
                  pages: pages,
                  onDone: () {
        
                    // TODO: Handle when onboarding is done
        
                    Get.offAllNamed(AppRoutes.roleScreen);
        
                  },
                  onSkip: () {
                    // TODO: Handle skip
                  },
                  showSkipButton: true,
                  next: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(color: AppColors.primaryColor, width: 0.8)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                        child: CustomText(text: "Skip"),
                      )),
                  skip: Icon(Icons.arrow_forward, color: Colors.transparent),
        
                  done: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: AppColors.primaryColor, width: 0.8)
                      ),
                      child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    child: CustomText(text: "Done"),
                  )),
                  dotsDecorator: DotsDecorator(
                    size: Size.square(10.0),
                    activeSize: Size(20.0, 10.0),
                    activeColor: Theme.of(context).primaryColor,
                    color: Colors.red.withOpacity(0.5),
                    spacing: EdgeInsets.symmetric(horizontal: 3.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
