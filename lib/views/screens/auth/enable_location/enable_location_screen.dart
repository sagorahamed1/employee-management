import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [


            SizedBox(height: 45.h),

            CustomText(text: "NeighborHubs", color: AppColors.textColorSecondary5EAAA8, fontSize: 22.h),

            SizedBox(height: 105.h),




            Assets.icons.locationParmission.svg(),


            CustomText(text: "Ready to join with your Neighbor", color: AppColors.textColorSecondary5EAAA8, fontSize: 22.h, bottom: 59.h),



            CustomText(text: "Enable location permission to meet your neighbor", fontSize: 16.h),

            Spacer(),

            CustomButton(title: "Enable Location", onpress: () {
              Get.toNamed(AppRoutes.neighborBottomNavBar);
            }),



            SizedBox(height: 100.h)





          ],
        ),
      ),
    );
  }
}
