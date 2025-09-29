import 'package:droke/core/app_constants/app_constants.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/helper/prefs_helper.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController roleCtrl = TextEditingController();


  @override
  void initState() {
    getRole();
    super.initState();
  }

  getRole()async{
    roleCtrl.text = await PrefsHelper.getString(AppConstants.role);
    setState(() {

    });

  }

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

            SizedBox(height: 20.h),

            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.cardColorEBEBEB
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all(12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomNetworkImage(
                                  height: 45.h,
                                  width: 45.w,
                                  boxShape: BoxShape.circle,
                                  imageUrl: "https://randomuser.me/api/portraits/men/19.jpg",
                                  border: Border.all(color: Colors.grey, width: 0.02),
                                )),

                            SizedBox(width: 12.w),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Lio", color: Colors.black),
                                CustomText(text: "320 Banasree", fontSize: 12.h, color: Colors.black),
                              ],
                            ),

                            Spacer(),

                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Color(0xffCBCBCB)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                    child: CustomText(
                                        text: "Paid", color: Colors.white),
                                  ),
                                ))


                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),





            if(roleCtrl.text != "freelancer")
            CustomButton(title: "Make Payment", onpress: () {
              Get.toNamed(AppRoutes.paymentDetailsScreen);
            }),



            SizedBox(height: 50.h)




          ],
        ),
      ),
    );
  }
}
