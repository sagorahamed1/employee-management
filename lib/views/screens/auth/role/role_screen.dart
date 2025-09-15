import 'package:droke/core/app_constants/app_constants.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_text.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {


  bool _moveUpHome = true;
  bool _moveUpBug = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 40.h),

            Image.asset("assets/images/logo.png"),


            CustomText(
              text: "How will you use NeighborHubs?",
              color: Color(0xff5EAAA8),
              fontSize: 22,
            ),


            CustomText(
              text: "Choose your role to get started",
              color: AppColors.textColor3B3B3B,
            ),


            SizedBox(height: 60.h),

            /// <<< ============><>>> Login text flied  << < ==============>>>

            Container(
              height: 590.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white
              ),
              child: Column(
                children: [

                  SizedBox(height: 89.h),

                  // TODO:  Neighbor =====>>>

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.logInScreen);
                      PrefsHelper.setString(AppConstants.role, "neighbor");
                    },
                    child: Container(
                      height: 171.h,
                      width: 142.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Color(0xffD46A6A1A).withOpacity(0.10),
                        border: Border.all(color:  AppColors.primaryColor, width: 2)
                      ),


                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: _moveUpHome ? -10 : 0),
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              onEnd: () {
                                setState(() {
                                  _moveUpHome = !_moveUpHome;
                                });
                              },
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(0, value),
                                  child: child,
                                );
                              },
                              child: Assets.icons.homeIcon.svg(), // Replace with your SVG icon
                            ),

                            CustomText(text: "I am a Neighbor", top: 14.h)


                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 48.h),


                  // TODO:  Freelancer =====>>>

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.logInScreen);
                      PrefsHelper.setString(AppConstants.role, "freelancer");
                    },
                    child: Container(
                      height: 171.h,
                      width: 142.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffd46a6a1a).withOpacity(0.10)
                      ),


                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: _moveUpBug ? -10 : 0),
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              onEnd: () {
                                setState(() {
                                  _moveUpBug = !_moveUpBug;
                                });
                              },
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(0, value),
                                  child: child,
                                );
                              },
                              child: Assets.icons.bugIcon.svg(), // Replace with your SVG icon
                            ),

                            CustomText(text: "I am a Freelancer", top: 14.h)


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
