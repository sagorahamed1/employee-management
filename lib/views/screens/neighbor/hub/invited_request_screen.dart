




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

class InvitedRequestScreen extends StatefulWidget {
  const InvitedRequestScreen({super.key});

  @override
  State<InvitedRequestScreen> createState() => _InvitedRequestScreenState();
}

class _InvitedRequestScreenState extends State<InvitedRequestScreen> {

  NeighborController neighborController = Get.find<NeighborController>();

  @override
  void initState() {
    neighborController.getInviteRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        elevation: 5,
        shadowColor: Colors.black,
        title: CustomText(text: "Invitation request", fontSize: 20.h, left: 60.w),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            SizedBox(height: 12.h),




            Expanded(
              child: Obx(()=>
              neighborController.inviteRequestLoading.value ? CustomShimmer() :
              neighborController.invitedRequest.isEmpty ? NoDataFoundCard() :
              ListView.builder(
                itemCount: neighborController.invitedRequest.length,
                itemBuilder: (context, index) {

                  var joinMember = neighborController.invitedRequest[index];

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
                                CustomText(text: "${joinMember.hubName}", fontSize: 14.h),
                                CustomText(text: "${joinMember.message}", fontSize: 12.h, maxline: 2),
                              ],
                            ),


                            Spacer(),


                            GestureDetector(
                                onTap: () {
                                  neighborController.inviteAccept(id: joinMember.id.toString(), status: "approved");
                                },
                                child: Assets.icons.acceptIcon.svg()),


                            GestureDetector(
                                onTap: (){
                                  neighborController.inviteAccept(id: joinMember.id.toString(), status: "rejected");

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
