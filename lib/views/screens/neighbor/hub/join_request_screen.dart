

import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/helper/toast_message_helper.dart';
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

class JoinRequestScreen extends StatefulWidget {
  const JoinRequestScreen({super.key});

  @override
  State<JoinRequestScreen> createState() => _JoinRequestScreenState();
}

class _JoinRequestScreenState extends State<JoinRequestScreen> {

  NeighborController neighborController = Get.find<NeighborController>();

  @override
  void initState() {
    var data = Get.arguments;
    neighborController.getJoinRequest(hubId: data["hubId"]);
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
        title: CustomText(text: "Join Request", fontSize: 20.h, left: 60.w),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            SizedBox(height: 12.h),




            Expanded(
              child: Obx(()=>
              neighborController.joinRequestLoading.value ? CustomShimmer() :
                  neighborController.geJoinRequest.isEmpty ? NoDataFoundCard() :
                 ListView.builder(
                  itemCount: neighborController.geJoinRequest.length,
                  itemBuilder: (context, index) {

                    var joinMember = neighborController.geJoinRequest[index];

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
                                    imageUrl: "${ApiConstants.imageBaseUrl}${joinMember.image}",
                                    border: Border.all(color: Colors.grey, width: 0.02),
                                  )),

                              SizedBox(width: 12.w),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "${joinMember.name}", fontSize: 14.h),
                                  CustomText(text: "${joinMember.address}", fontSize: 12.h),
                                ],
                              ),


                              Spacer(),


                              GestureDetector(
                                  onTap: () {
                                    neighborController.acceptJoinRequest(hubId: data["hubId"],status:  "accepted");
                                  },
                                  child: Assets.icons.acceptIcon.svg()),


                              GestureDetector(
                                  onTap: (){
                                    neighborController.acceptJoinRequest(hubId: data["hubId"],status:  "rejected");
                                  },
                                  child: Assets.icons.rejectIcon.svg()),



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
