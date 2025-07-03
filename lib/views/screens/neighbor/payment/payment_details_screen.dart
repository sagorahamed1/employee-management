import 'package:droke/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../../global/custom_assets/assets.gen.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 5,
          shadowColor: Colors.black,
          title: CustomText(text: "Payment", fontSize: 20.h)
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [

            SizedBox(height: 30.h),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Date & time", color: Color(0xff423C3C)),
                CustomText(text: "05.00 AM, 12 June 2023"),

              ],
            ),

            Divider(),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Sub Total", color: Color(0xff423C3C)),
                CustomText(text: "\$150"),

              ],
            ),

            Divider(),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Sub Neighbor", color: Color(0xff423C3C)),
                CustomText(text: "7"),

              ],
            ),

            Divider(),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Your Pay", color: Color(0xff423C3C)),
                CustomText(text: "\$21.54", color: Colors.red),

              ],
            ),

            Divider(),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Grand Total", color: Colors.red, fontWeight: FontWeight.w600),
                CustomText(text: "26.54", color: Colors.red, fontWeight: FontWeight.w600),

              ],
            ),




            Spacer(),

            CustomButton(title: "Payment", onpress: () {

            }),



            SizedBox(height: 50.h)




          ],
        ),
      ),
    );
  }
}
