


import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/custom_text.dart';


class FreelancerProfileScreen extends StatefulWidget {
  const FreelancerProfileScreen({super.key});

  @override
  State<FreelancerProfileScreen> createState() => _FreelancerProfileScreenState();
}

class _FreelancerProfileScreenState extends State<FreelancerProfileScreen> {



  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(text: "Freelancer Profile", fontSize: 20.h, left: 60.w),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [


            SizedBox(height: 10.h),


            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 18.h),
              decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24.r)),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28.h),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CustomNetworkImage(
                         imageUrl: "${data["image"]}",
                          height: 200.h,
                          width: 200.w),
                    ),
                    CustomText(
                        text: "${data["description"]}",
                        fontSize: 12.h,
                        textAlign: TextAlign.start,
                        maxline: 15,
                        top: 16.h,
                        bottom: 8.h),



                    keyValueText(
                        keyText: "Freelancer",
                        valueText: "${data["freelancer"]}"
                    ),

                    keyValueText(
                        keyText: "Service Title",
                        valueText: "${data["taskTitle"]}"
                    ),



                    keyValueText(
                        keyText: "Service Category",
                        valueText: "${data["taskType"]}"
                    ),

                    keyValueText(
                        keyText: "Available Time",
                        valueText: "${data["scheduledTime"]}"
                    ),


                    keyValueText(
                        keyText: "Location",
                        valueText: "${data["location"]}"
                    ),



                    keyValueText(
                        keyText: "Rent",
                        valueText: "${data["price"]}"
                    ),


                    keyValueText(
                        keyText: "Rating",
                        valueText: "★★★★"
                    )



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  keyValueText({required String keyText, valueText}){
    return                  Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          SizedBox(
              width: 120.w,
              child: CustomText(text: "$keyText", textAlign: TextAlign.start)),


          CustomText(text: ":  $valueText", italic: true)
        ],
      ),
    );
  }
}
