import 'package:droke/controller/freelancer/freelancer_controller.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../../services/api_constants.dart';
import '../../../widgets/custom_shimmer.dart';
import '../../../widgets/shop_task_card.dart';

class FreelancerHomeScreen extends StatefulWidget {
  const FreelancerHomeScreen({super.key});

  @override
  State<FreelancerHomeScreen> createState() => _FreelancerHomeScreenState();
}

class _FreelancerHomeScreenState extends State<FreelancerHomeScreen> {

  NeighborController neighborController = Get.find<NeighborController>();
  FreelancerController freelancerController = Get.find<FreelancerController>();
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    neighborController.getService();
    freelancerController.getHubs();
    profileController.getUserLocalData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Obx(() =>
                //     CustomNetworkImage(
                //         imageUrl: "${ApiConstants.imageBaseUrl}",
                //         boxShape: BoxShape.circle,
                //         border: Border.all(color: Colors.grey),
                //         height: 40.h,
                //         width: 40.w),
                // ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    child: Assets.images.notificationImage.image()),
              ],
            ),
          ),
          Obx(()=>
              CustomText(
                  text: "Hey ${profileController.name.value}",
                  fontSize: 22.h,
                  color: AppColors.textColorSecondary5EAAA8),
          ),
          CustomText(text: "Find Your helping hand", fontSize: 10.h, top: 6.h),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: "Available Services",
                  left: 20.w,
                  bottom: 12.h,
                  top: 12.h)),



          // SizedBox(
          //   height: 240.h,
          //   child: ListView.builder(
          //     itemCount: 3,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Get.toNamed(AppRoutes.serviceDetailsScreen, arguments: {
          //             "role" : "freelancer"
          //           });
          //         },
          //         child: Container(
          //           margin: EdgeInsets.only(
          //             right: 10.w,
          //             left: index == 0 ? 20 : 0,
          //             bottom: 14.h,
          //           ),
          //           width: 164.w,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12.r),
          //             color: AppColors.bgColor,
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.5),
          //                 blurRadius: 3,
          //                 offset: Offset(-2, 1),
          //               ),
          //             ],
          //           ),
          //           child: Padding(
          //             padding: EdgeInsets.all(8.r),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Image.asset("assets/images/serviceImage1.png",
          //                     width: 154.w),
          //                 CustomText(text: "Personal Need", fontSize: 10.h),
          //                 CustomText(text: "• Grocery Shopping", fontSize: 10.h),
          //                 CustomText(text: "• Grocery Shopping", fontSize: 10.h),
          //                 CustomText(text: "• Grocery Shopping", fontSize: 10.h),
          //                 CustomText(text: "• Grocery Shopping", fontSize: 10.h),
          //                 CustomText(text: "• Grocery Shopping", fontSize: 10.h),
          //                 SizedBox(height: 12.h),
          //                 Align(
          //                   alignment: Alignment.centerRight,
          //                   child: Container(
          //                     width: 80.w,
          //                     decoration: BoxDecoration(
          //                       color: AppColors.primaryColor,
          //                       borderRadius: BorderRadius.circular(20.r),
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.black.withOpacity(0.5),
          //                           blurRadius: 1,
          //                           offset: Offset(-1, -1),
          //                         ),
          //                       ],
          //                     ),
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Icon(Icons.description,
          //                             color: Colors.white, size: 10.h),
          //                         CustomText(
          //                           text: "View details",
          //                           color: Colors.white,
          //                           fontSize: 9.h,
          //                           top: 3.h,
          //                           bottom: 3.h,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),




          SizedBox(
            height: 250.h,
            child: Obx(
                  () => neighborController.serviceLoading.value
                  ? Padding(
                padding:  EdgeInsets.only(left: 20.w),
                child: ShimmerServiceCard(),
              )
                  : neighborController.services.isEmpty
                  ? CustomText(text: "No Data Found!")
                  : ListView.builder(
                itemCount: neighborController.services.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var service = neighborController.services[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.serviceDetailsScreen,
                          arguments: {"role": "freelancer", "id" : service.id});
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 10.w,
                        left: index == 0 ? 20 : 0,
                        bottom: 14.h,
                      ),
                      width: 164.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.bgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 3,
                            offset: Offset(-2, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            // Image.asset("assets/images/serviceImage1.png",
                            //     width: 154.w),

                            CustomNetworkImage(
                                borderRadius: BorderRadius.circular(10.r),
                                imageUrl: "",
                                // "${ApiConstants.imageBaseUrl}${service.image}",
                                width: 154.w,
                                height: 87.h),

                            CustomText(
                                text: "${service.taskCategory}",
                                fontSize: 10.h),

                            ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics:
                                NeverScrollableScrollPhysics(),
                                itemCount: service.taskList?.length,
                                itemBuilder: (context, index) {
                                  return CustomText(
                                      text:
                                      "• ${service.taskList?[index]}",
                                      fontSize: 10.h,
                                      textAlign: TextAlign.start);
                                }),

                            SizedBox(height: 12.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius:
                                  BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.5),
                                      blurRadius: 1,
                                      offset: Offset(-1, -1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.description,
                                        color: Colors.white,
                                        size: 10.h),
                                    CustomText(
                                      text: "View details",
                                      color: Colors.white,
                                      fontSize: 9.h,
                                      top: 3.h,
                                      bottom: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),



          SizedBox(height: 0,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Join ongoing Hub in your area",
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.freelancerHubSearchScreen, arguments: {
                      "role" : "freelancer",
                      "category" : ""
                    });
                  },
                  child: CustomText(
                    text: "More",
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 14.h),

          Expanded(
            child: Obx(() =>
            freelancerController.getHubsLoading.value ? CustomShimmer() :
            freelancerController.hubs.isEmpty ? CustomText(text: "No Data Found!",) :
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: freelancerController.hubs.length,
              itemBuilder: (context, index) {
                var hub = freelancerController.hubs[index];
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                    child: ShopTaskCard(
                      imagePath: "${ApiConstants.imageBaseUrl}${hub.image}",
                      taskTitle: "${hub.taskTitle}",
                      taskType: "${hub.taskCategory}",
                      peopleJoined: "${hub.pepoleJoined} Neighbors joined",
                      organizer: "${hub.organizer}",
                      scheduledTime: "",
                      payAmount: "",
                      btnName: "Apply",
                      BtnOnTap: () {

                      },
                      onTap: () {
                        print("kdkdkkdkdkdkdkdkdkdkd");
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


