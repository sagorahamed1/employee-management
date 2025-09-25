

import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';

class JoinRequestScreen extends StatelessWidget {
  const JoinRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 5,
        shadowColor: Colors.black,
        title: CustomText(text: "Join Request", fontSize: 20.h, left: 60.w),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            SizedBox(height: 12.h),




            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(top: 12.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color(0xffF4F1EE)
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all(12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomNetworkImage(
                                  height: 60.h,
                                  width: 60.w,
                                  boxShape: BoxShape.circle,
                                  imageUrl: "https://randomuser.me/api/portraits/men/10.jpg",
                                  border: Border.all(color: Colors.grey, width: 0.02),
                                )),

                            SizedBox(width: 12.w),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Lio", fontSize: 14.h),
                                CustomText(text: "320 B. Banascree", fontSize: 12.h),
                              ],
                            ),


                            Spacer(),
                            Assets.icons.acceptIcon.svg(),
                            Assets.icons.rejectIcon.svg(),



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
      ),

    );
  }
}
