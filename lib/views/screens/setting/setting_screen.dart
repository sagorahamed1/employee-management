import 'package:droke/core/app_constants/app_constants.dart';
import 'package:droke/helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../core/app_constants/app_colors.dart';
import '../../../core/config/app_route.dart';
import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "Setting", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),


            _customCartItem(
                title: "Change Password",
                icon: Assets.icons.lock.svg(),
                onTap: () {
                   Get.toNamed(AppRoutes.changePasswordScreen);
                }),





            _customCartItem(
                title: "Privacy Policy",
                icon: Assets.icons.privacyPolicyIcon.svg(),
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyAllScreen, arguments: {
                    "title" : "Privacy Policy",
                  });
                }),



            _customCartItem(
                title: "Help & Support",
                icon: Assets.icons.helpSupportIcon.svg(),
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyAllScreen, arguments: {
                    "title" : "Help & Support",
                  });
                }),


            _customCartItem(
                title: "Terms of service",
                icon: Assets.icons.termsServicesIcon.svg(),
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyAllScreen, arguments: {
                    "title" : "Terms of service",
                  });
                }),





            _customCartItem(
                title: "About Us",
                icon: Assets.icons.aboutUsIcon.svg(),
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyAllScreen, arguments: {
                    "title" : "About Us",
                  });
                }),




            Spacer(),


            CustomButton(
                color: Colors.transparent,
                titlecolor: Colors.black,
                boderColor: Colors.grey,
                title: "Delete Account", onpress: () {

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                            text: "Delete Account",
                            fontSize: 16.h,
                            fontWeight: FontWeight.w600,
                            top: 20.h,
                            bottom: 12.h,
                            color: Color(0xff592B00)),
                        Divider(),
                        SizedBox(height: 12.h),
                        CustomText(
                          maxline: 2,
                          bottom: 20.h,
                          text: "Are you sure want to delete your Account?",
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                  height: 50.h,
                                  title: "Cancel",
                                  onpress: () {
                                    Get.back();
                                  },
                                  color: Colors.transparent,
                                  fontSize: 11.h,
                                  loaderIgnore: true,
                                  boderColor: Colors.black,
                                  titlecolor: Colors.black),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                  loading: false,
                                  loaderIgnore: true,
                                  height: 50.h,
                                  title: "Yes, Delete",
                                  onpress: () async{
                                    await PrefsHelper.remove(AppConstants.name);
                                    await PrefsHelper.remove(AppConstants.email);
                                    await PrefsHelper.remove(AppConstants.image);
                                    await PrefsHelper.remove(AppConstants.address);
                                    await PrefsHelper.remove(AppConstants.number);
                                    await PrefsHelper.remove(AppConstants.bearerToken);
                                    await PrefsHelper.remove(AppConstants.isLogged);
                                    await PrefsHelper.remove(AppConstants.rating);
                                    await PrefsHelper.remove(AppConstants.userId);
                                    await PrefsHelper.remove(AppConstants.role);
                                    await PrefsHelper.remove(AppConstants.dateOfBirth);
                                   Get.offAllNamed(AppRoutes.roleScreen);
                                  },
                                  fontSize: 11.h),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }),


            SizedBox(height: 80.h)


          ],
        ),
      ),
    );
  }

  Widget _customCartItem(
      {required String title,
      required Widget icon,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.primaryColor)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
            child: Row(
              children: [
                icon,
                CustomText(text: "$title", color: Colors.black, left: 16.w),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
