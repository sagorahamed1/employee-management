
import 'package:droke/core/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final TextEditingController emailCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 40.h),

            Image.asset("assets/images/logo.png"),


            CustomText(
              text: "Forget Your Password?",
              color: Color(0xff5EAAA8),
              fontSize: 22,
            ),


            CustomText(
              text: "Please enter the 6 digit verification code sent \n to your e-mail",
              color: AppColors.textColor3B3B3B,
            ),


            SizedBox(height: 60.h),

            /// <<< ============><>>> Login text flied  << < ==============>>>

            Container(
              height: 590.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white
              ),
              child: Column(
                children: [

                  SizedBox(height: 40.h),

                  CustomTextField(controller: emailCtrl, labelText: "Email", hintText: "Enter your email", isEmail: true),


                  Spacer(),

                  CustomButton(title: "GET VERIFICATION CODE", onpress: () {
                    Get.toNamed(AppRoutes.optScreen);
                  }),




                  SizedBox(height: 160.h),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}




