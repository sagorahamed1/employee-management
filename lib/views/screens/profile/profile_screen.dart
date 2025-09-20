import 'package:droke/controller/profile_controller.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.getUserLocalData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [


          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffFCEED4),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
            child: Column(
              children: [

                SizedBox(height: 65.h),


                Obx(() =>
                   ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CustomNetworkImage(
                        height: 100.h,
                        width: 100.w,
                        boxShape: BoxShape.circle,
                        imageUrl: "${ApiConstants.imageBaseUrl}${profileController.image.value}",
                        border: Border.all(color: Colors.grey, width: 0.02),
                      )),
                ),


                Obx(() => CustomText(text: "${profileController.name.value}", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8, top: 8.h)),

                Obx(() => CustomText(text: "${profileController.email.value}", fontSize: 10.h, top: 6.h)),
                Obx(() => CustomText(text: "${profileController.phone.value}", fontSize: 10.h, bottom: 16.h)),


              ],
            ),
          ),



          SizedBox(height: 24.h),


          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffFCEED4)),
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                children: [

                  SizedBox(height: 16.h),


                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.profileInformationScreen, arguments: {
                        "name" : profileController.name.value,
                        "image" : profileController.image.value,
                         "email" : profileController.email.value,
                        "phone" : profileController.phone.value,
                        "address" : profileController.address.value
                      })?.then((_){
                        profileController.getUserLocalData();
                      });
                    },
                    child: Row(
                      children: [
                        Assets.icons.profileInfo.svg(),
                        SizedBox(width: 12.w),

                        CustomText(text: "Profile Information", fontSize: 16.h)
                      ],
                    ),
                  ),


                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.walletScreen);
                    },
                    child: Row(
                      children: [
                        Assets.icons.wallet.svg(),
                        SizedBox(width: 12.w),

                        CustomText(text: "Wallet", fontSize: 16.h)
                      ],
                    ),
                  ),



                  // SizedBox(height: 14.h),
                  // GestureDetector(
                  //   onTap: (){},
                  //   child: Row(
                  //     children: [
                  //       Assets.icons.inviteIcon.svg(),
                  //       SizedBox(width: 12.w),
                  //
                  //       CustomText(text: "Invite friends", fontSize: 16.h)
                  //     ],
                  //   ),
                  // ),
                  //


                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.settingScreen);
                    },
                    child: Row(
                      children: [
                        Assets.icons.settings.svg(),
                        SizedBox(width: 12.w),

                        CustomText(text: "Setting", fontSize: 16.h)
                      ],
                    ),
                  ),

                  SizedBox(height: 100.h),


                ],
              ),
            ),
          ),



          SizedBox(height: 24.h),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () {



                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                              text: "Log Out",
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
                            text: "Are you sure want to logout your Account?",
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
                                    title: "Yes, Logout",
                                    onpress: () {
                                      Get.back();
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


              },
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFCEED4)),
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: Column(
                  children: [



                    Row(
                      children: [
                        Assets.icons.logOut.svg(),
                        SizedBox(width: 12.w),

                        CustomText(text: "Log Out", fontSize: 16.h)
                      ],
                    ),



                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
