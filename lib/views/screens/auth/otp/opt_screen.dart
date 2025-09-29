import 'package:droke/core/config/app_route.dart';
import 'package:droke/helper/toast_message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class OptScreen extends StatefulWidget {
  OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  final TextEditingController pinCtrl = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AuthController authController = Get.find<AuthController>();


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.startCountdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
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



                  Obx(() =>
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: authController.isCountingDown.value
                            ? "${authController.countdown.value}" : "Didn't get the code?",
                          color: authController.isCountingDown.value ? Colors.red : Colors.black,
                        ),
                        GestureDetector(
                            onTap: () {
                              if(authController.isCountingDown.value){
                                ToastMessageHelper.showToastMessage("Already send an otp code to your email");
                              }else{
                                authController.reSendOtp();

                                pinCtrl.text = "";
                              }
                            },
                            child: CustomText(text: "Resend", color: Colors.red))
                      ],
                    ),
                  ),
                  Spacer(),
                  Obx(() =>
                     CustomButton(
                        loading: authController.verfyLoading.value,
                        title: "VERIFY", onpress: () {

                          if(data["screenType"] == "forgot"){
                            authController.verfyEmail(pinCtrl.text, screenType: "forgot");
                          }else{
                            authController.verfyEmail(pinCtrl.text, screenType: "signup");
                          }



                    }),
                  ),
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
