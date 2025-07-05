import 'package:droke/core/config/app_route.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.black,
          title: CustomText(
              text: "Schedule",
              fontSize: 20.h,
              color: AppColors.textColorSecondary5EAAA8)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            CustomText(text: "Personal needs", bottom: 14.h),
            CustomText(text: "Gig worker: David", fontWeight: FontWeight.w200),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: "Available time:  10:00Am - 04:00Pm",
                  bottom: 24.h,
                  top: 6.h,
                  fontWeight: FontWeight.w200),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.cardColorEBEBEB),
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomNetworkImage(
                                  height: 64.h,
                                  width: 64.w,
                                  borderRadius: BorderRadius.circular(6.r),
                                  imageUrl:
                                      "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                                  border: Border.all(
                                      color: Colors.grey, width: 0.02),
                                )),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "Grocery Shopping",
                                    color: Colors.black,
                                    fontSize: 12.h),
                                SizedBox(height: 6.h),
                                CustomText(text: "(hub name)", fontSize: 9.h),
                              ],
                            ),
                            Spacer(),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 4.h),
                                  child: CustomText(
                                      text: "10:15 AM", color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
