import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/shop_task_card.dart';

class FreelancerHubScreen extends StatefulWidget {
  FreelancerHubScreen({super.key});

  @override
  State<FreelancerHubScreen> createState() => _FreelancerHubScreenState();
}

class _FreelancerHubScreenState extends State<FreelancerHubScreen> {
  bool _isSearching = false;

  // <--- track search state
  TextEditingController _searchController = TextEditingController();

  Widget _buildSearchField() {
    return Column(
      children: [
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
        leading: SizedBox.shrink(),
        title: _isSearching
            ? _buildSearchField()
            : CustomText(
                text: "Available Hubs",
                fontSize: 22.h,
                color: AppColors.textColorSecondary5EAAA8,
              ),
        actions: [

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



            SizedBox(height: 16.h),

            // TODO : <<< ==========  List view ========>>>

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () {
                          Get.toNamed(AppRoutes.hubHomeScreen, arguments: {
                            "role" : "freelancer"
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
                                imageUrl: "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg"  ,
                                border: Border.all(
                                    color: Colors.grey, width: 0.02),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: "Hub Name",
                                        bottom: 6.h,
                                        fontWeight: FontWeight.w500),
                                    CustomText(
                                        text: "Alex invited you to their group.",
                                        fontSize: 12.h,
                                        fontWeight: FontWeight.w300),
                                  ],
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 45.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.r),
                                        color: Color(0xffD9D9D9)
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                        child: CustomText(
                                            text: "11 Members", fontSize: 9.h),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
