import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/shop_task_card.dart';

class NeighborHomeScreen extends StatelessWidget {
  const NeighborHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNetworkImage(
                    imageUrl: "https://randomuser.me/api/portraits/men/25.jpg",
                    boxShape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                    height: 40.h,
                    width: 40.w),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    child: Assets.images.notificationImage.image()),
              ],
            ),
          ),
          CustomText(
              text: "Hey Alexendra",
              fontSize: 22.h,
              color: AppColors.textColorSecondary5EAAA8),
          CustomText(text: "Find Your helping hand", fontSize: 10.h, top: 6.h),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: "Available Services",
                  left: 20.w,
                  bottom: 12.h,
                  top: 12.h)),
          SizedBox(
            height: 240.h,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.serviceDetailsScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 10.w,
                      left: index == 0 ? 20 : 0,
                      bottom: 14.h,
                    ),
                    width: 164.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(-2, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/serviceImage1.png",
                              width: 154.w),
                          CustomText(text: "Personal Need", fontSize: 10.h),
                          CustomText(text: "• Grocery Shopping", fontSize: 10.h),
                          CustomText(text: "• Grocery Shopping", fontSize: 10.h),
                          CustomText(text: "• Grocery Shopping", fontSize: 10.h),
                          CustomText(text: "• Grocery Shopping", fontSize: 10.h),
                          CustomText(text: "• Grocery Shopping", fontSize: 10.h),
                          SizedBox(height: 12.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 1,
                                    offset: Offset(-1, -1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.description,
                                      color: Colors.white, size: 10.h),
                                  CustomText(
                                    text: "View details",
                                    color: Colors.white,
                                    fontSize: 9.h,
                                    top: 3.h,
                                    bottom: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),


          SizedBox(height: 0,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Join ongoing Hub in your area",
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.neighborHubSearchScreen);
                  },
                  child: CustomText(
                    text: "More",
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 14.h),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                  child: ShopTaskCard(
                    imagePath:
                        "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                    taskTitle: "Grocery run to Trader Joe's",
                    taskType: "Personal Needs",
                    scheduledTime: "9:30AM Today",
                    peopleJoined: "3 Neighbors joined",
                    organizer: "Maria from Pine Street",
                    payAmount: "\$5",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


