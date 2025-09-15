import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/config/app_route.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "Wallet", color: AppColors.textColorSecondary5EAAA8, fontSize: 22.h)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              // height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                      image: AssetImage("assets/images/wallet.png"))),
              child: Padding(
                padding: EdgeInsets.all(19.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Available Balance",
                        fontSize: 20.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    CustomText(
                        text: "\$ 12000",
                        fontSize: 32.h,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),



                    CustomButton(
                        height: 40.h,
                        color: Colors.white,
                        boderColor: Colors.white,
                        titlecolor: AppColors.primaryColor,
                        title: "Withdraw Now", onpress: () {

                    })

                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "History",
                    fontSize: 17.h,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                // GestureDetector(
                //   onTap: () {
                //
                //   },
                //   child: CustomText(
                //       text: "More...",
                //       fontWeight: FontWeight.w500,
                //       color: Colors.black),
                // ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding:
                    EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey, width: 0.08),
                    ),
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Withdraw",
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                bottom: 6.h),

                            CustomText(text: "21 April 2025", fontSize: 12.h),

                            CustomText(
                                text: "Transition id: 4524214212",
                                fontSize: 12.h),
                          ],
                        ),
                        Spacer(),
                        CustomText(
                            text: "\$ 25",
                            fontSize: 28.h,
                            color: AppColors.primaryColor),
                        SizedBox(width: 8.w)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
