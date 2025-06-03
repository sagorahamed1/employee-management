import 'package:droke/core/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class OptScreen extends StatelessWidget {
  OptScreen({super.key});

  final TextEditingController pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),

            Image.asset("assets/images/logo.png"),

            CustomText(
              text: "Enter Verification Code",
              color: Color(0xff5EAAA8),
              fontSize: 22,
            ),

            CustomText(
              text:
                  "Please enter the 6 digit verification code sent\nto your e-mail",
              color: AppColors.textColor3B3B3B,
            ),

            SizedBox(height: 60.h),

            /// <<< ============><>>> Login text flied  << < ==============>>>

            Container(
              height: 590.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 60.h),







                  // TODO: Pin Code TextField

                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: pinCtrl,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveColor: AppColors.borderColor,
                      selectedColor: AppColors.borderColor,
                      activeColor: AppColors.borderColor,
                      disabledColor: AppColors.borderColor,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: false,
                    onChanged: (value) {},
                  ),



                  SizedBox(height: 24.h),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Didn't get the code?"),
                      CustomText(text: "Resend", color: Colors.red)
                    ],
                  ),
                  Spacer(),
                  CustomButton(title: "VERIFY", onpress: () {
                    Get.toNamed(AppRoutes.resetPasswordScreen);
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
