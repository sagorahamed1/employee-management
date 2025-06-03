import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeighborHomeScreen extends StatelessWidget {
  const NeighborHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNetworkImage(
                    imageUrl: "https://randomuser.me/api/portraits/men/25.jpg",
                    boxShape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                    height: 40.h, width: 40.w),

                Assets.images.notificationImage.image(),

              ],
            ),
          ),


          CustomText(text: "Hey Alexendra", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8),
          CustomText(text: "Find Your helping hand", fontSize: 10.h, top: 8.h),




          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: "Available Services", left: 20.w, bottom: 20.h, top: 20.h)),


          SizedBox(
            height: 230.h,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(right: 10.w, left: index == 0 ? 20 : 0),
                  child: Container(
                    width: 164.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(-2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image.asset("assets/images/serviceImage1.png", width: 154.w),

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
                                  Icon(Icons.description, color: Colors.white, size: 10.h),

                                  CustomText(text: "View details", color: Colors.white, fontSize: 9.h, top: 3.h, bottom: 3.h)
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )





        ],
      ),
    );
  }
}


