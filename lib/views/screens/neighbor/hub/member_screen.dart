import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_shimmer.dart';
import 'package:droke/views/widgets/no_data_found_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {

  NeighborController neighborController = Get.find<NeighborController>();

  @override
  void initState() {
    var data = Get.arguments;
    neighborController.getMember(hubId: data["hubId"]);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 5,
        shadowColor: Colors.black,
        title: CustomText(text: "Member", fontSize: 20.h, left: 60.w),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            SizedBox(height: 12.h),


            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.joinRequestScreen, arguments: {
                  "hubId" : data["hubId"]
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.bgColor
                ),

                child: Padding(
                  padding:  EdgeInsets.all(20.r),
                  child: Row(
                    children: [

                      Assets.icons.memberAddIcon.svg(),

                      SizedBox(width: 16.w),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomText(text: "Join Requests", color: AppColors.primaryColor),
                          CustomText(text: "4 Join Requests Pending", fontSize: 12.h),


                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),




            Expanded(
              child: Obx(() =>
              neighborController.memberLoading.value ? CustomShimmer() : neighborController.members.isEmpty ? NoDataFoundCard() :
                 ListView.builder(
                  itemCount: neighborController.members.length,
                  itemBuilder: (context, index) {
                    var member = neighborController.members[index];
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
                                    imageUrl: "${ApiConstants.imageBaseUrl}${member.image}",
                                    border: Border.all(color: Colors.grey, width: 0.02),
                                  )),

                              SizedBox(width: 12.w),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "${member.name}", fontSize: 14.h),
                                  CustomText(text: "${member.address ?? "N/A"}", fontSize: 12.h),
                                ],
                              ),



                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )



          ],
        ),
      ),

    );
  }
}
