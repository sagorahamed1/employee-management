import 'package:droke/controller/neighbor/neighbor_controller.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_shimmer.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/shop_task_card.dart';

class HubScreen extends StatefulWidget {
  HubScreen({super.key});

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  NeighborController neighborController = Get.find<NeighborController>();
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();



  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    neighborController.getMyHubs();
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        neighborController.loadMore(screenType: "myHub");
        print("load more true");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    neighborController.page.value = 1;
    neighborController.myHubs.value = [];
    super.dispose();
  }

  Widget _buildSearchField() {
    return Column(
      children: [
        SizedBox(height: 8.h),
        CustomTextField(
            controller: _searchController,
            hintText: "Search for hub and people",
            filColor: Color(0x50C1C1C1),
            suffixIcon: IconButton(
              icon: Icon(Icons.close, color: AppColors.primaryColor),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                });
              },
            ),
            onChanged: (value) {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        title: _isSearching
            ? _buildSearchField()
            : CustomText(
                text: "Available Hubs",
                fontSize: 22.h,
                color: AppColors.textColorSecondary5EAAA8,
              ),
        actions: [
          // _isSearching ? SizedBox() : Assets.images.addhubImage.image(),
          _isSearching
              ? SizedBox()
              : GestureDetector(
                  child: Assets.images.searchImage.image(),
                  onTap: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
          SizedBox(width: _isSearching ? 0 : 20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [






            //
            // // TODO : <<< ==========  Two Button ========>>>
            //
            //
            // Row(
            //   children: [
            //     Expanded(
            //         flex: 1,
            //         child: CustomButton(
            //           height: 35.h,
            //             fontSize: 12.h,
            //             color: _isHubSelected ? Colors.transparent : AppColors.textColorSecondary5EAAA8,
            //             titlecolor: _isHubSelected ? AppColors.textColorSecondary5EAAA8 : Colors.white,
            //             boderColor: _isHubSelected ? AppColors.textColorSecondary5EAAA8 : Colors.transparent,
            //             title: "Hubs",
            //             onpress: () {
            //             _isHubSelected = false ;
            //             setState(() {});
            //             })),
            //
            //
            //     SizedBox(width: 20.w),
            //
            //     Expanded(
            //         flex: 1,
            //         child: CustomButton(
            //             color: _isHubSelected ? AppColors.textColorSecondary5EAAA8 :  Colors.transparent,
            //             boderColor: _isHubSelected ? Colors.transparent : AppColors.textColorSecondary5EAAA8,
            //             titlecolor: _isHubSelected ? Colors.white : AppColors.textColorSecondary5EAAA8,
            //             height: 35.h,
            //             fontSize: 12.h,
            //             title: "People", onpress: () {
            //           _isHubSelected = true ;
            //           setState(() {});
            //         }))
            //   ],
            // ),
            //
            //


            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.invitedRequestScreen)?.then((_){
                  neighborController.myHubs.value = [];
                  neighborController.getMyHubs();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Color(0xffFCEED4)),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.icons.memberAddIcon.svg(),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text:  "Invitation Request",
                                bottom: 6.h,
                                color: Color(0xffD46A6A),
                                fontWeight: FontWeight.w500),
                            Obx(()=>
                               CustomText(
                                  text: "${neighborController.invitedCount.value} Invitation Pending",
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(height: 16.h),

            // TODO : <<< ==========  List view ========>>>

            Expanded(
              child: Obx(() =>
              neighborController.myHubLoading.value ? CustomShimmer() :
                  neighborController.myHubs.isEmpty ? CustomText(text: "No Hub Available") :
                 ListView.builder(
                   controller: _scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: neighborController.myHubs.length +1,
                  itemBuilder: (context, index) {

                    if(index < neighborController.myHubs.length){
                      var hub = neighborController.myHubs[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: GestureDetector(
                          onTap: () {

                            Get.toNamed(AppRoutes.hubHomeScreen, arguments: {
                              "role" : "neighbor",
                              "hubId" : hub.id,
                              "image" : "${ApiConstants.imageBaseUrl}${hub.image}",
                              "name" : "${hub.hubName}"
                            });


                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xffF4F1EE)),
                            child: Padding(
                              padding: EdgeInsets.all(12.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomNetworkImage(
                                    height: 60.h,
                                    width: 60.w,
                                    boxShape: BoxShape.circle,
                                    imageUrl: "${ApiConstants.imageBaseUrl}${hub.image}"  ,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.02),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text:  "${hub.hubName}",
                                            bottom: 6.h,
                                            fontWeight: FontWeight.w500),
                                        CustomText(
                                            text: "${hub.task}",
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w300),
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 45.h),
                                        child: CustomText(
                                            text: "${hub.neighborCount} Members", fontSize: 9.h),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }else if(index >= neighborController.totalResult){
                      return null;
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
