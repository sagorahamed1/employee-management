import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController newCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              SizedBox(height: 40.h),

              Image.asset("assets/images/logo.png"),

              CustomText(
                text: "Reset Your Password.",
                color: Color(0xff5EAAA8),
                fontSize: 22,
              ),

              CustomText(
                text: "Password  must have 6-8 characters.",
                color: AppColors.textColor3B3B3B,
              ),

              SizedBox(height: 60.h),

              /// <<< ============><>>> Login text flied  << < ==============>>>

              Container(
                height: 590.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    CustomTextField(
                        controller: newCtrl,
                        labelText: "New Password",
                        hintText: "Enter your password",
                        isPassword: true),
                    CustomTextField(
                        controller: confirmPassCtrl,
                        labelText: "Confirm Password",
                        hintText: "Enter your password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          } else if (value != newCtrl.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        isPassword: true),
                    Spacer(),
                    CustomButton(
                        title: "Reset",
                        onpress: () {
                          if (globalKey.currentState!.validate()) {
                            authController.setPassword(newCtrl.text);
                          }
                        }),
                    SizedBox(height: 160.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
