import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passWordCtrl = TextEditingController();
  final TextEditingController confirmPassWordCtrl = TextEditingController();
  RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 40.h),

            Image.asset("assets/images/logo.png"),


            CustomText(
              text: "Create your Account",
              color: Color(0xff5EAAA8),
              fontSize: 22,
            ),


            CustomText(
              text: "Make sure your account keep secure",
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
                  CustomTextField(controller: passWordCtrl, labelText: "Password", hintText: "Enter your password", isPassword: true),
                  CustomTextField(controller: confirmPassWordCtrl, labelText: "Confirm Password", hintText: "Re-enter your password", isPassword: true),


                  SizedBox(height: 10.h),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() =>
                          Transform.translate(
                            offset: const Offset(0, -18),
                            child: Checkbox(
                              value: isChecked.value,
                              onChanged: (value) {

                                isChecked.value = value!;

                              },
                            ),
                          ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style:  TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              fontSize: 13.h,
                            ),
                            children: [
                              const TextSpan(text: 'I agree with '),
                              TextSpan(
                                text: 'terms of services',
                                style:  TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Open Terms of Service
                                  },
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'privacy policy.',
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Open Privacy Policy
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 10.h),

                  CustomButton(title: "SIGN UP", onpress: () {

                  }),



                  SizedBox(height: 24.h),

                  RichText(
                    text: TextSpan(
                      style:  TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        fontSize: 13.h,
                      ),
                      children: [
                        const TextSpan(text: 'Already have an account ?  '),
                        TextSpan(
                          text: 'Sign In',
                          style:  TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.logInScreen);
                            },
                        )
                      ],
                    ),
                  ),



                  SizedBox(height: 40.h),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}



