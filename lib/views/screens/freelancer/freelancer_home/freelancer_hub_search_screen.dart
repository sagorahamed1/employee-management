


import 'dart:async';

import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/freelancer/freelancer_controller.dart';
import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../services/api_constants.dart';
import '../../../widgets/custom_shimmer.dart';
import '../../../widgets/shop_task_card.dart';

class FreelancerHubSearchScreen extends StatefulWidget {
  FreelancerHubSearchScreen({super.key});

  @override
  State<FreelancerHubSearchScreen> createState() =>
      _FreelancerHubSearchScreenState();
}

class _FreelancerHubSearchScreenState extends State<FreelancerHubSearchScreen> {



  FreelancerController freelancerController = Get.find<FreelancerController>();
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  Timer? debounce;



  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      freelancerController.getHubs();
    });


    super.initState();
  }



  Widget _buildSearchField() {
    return Column(
      children: [
        SizedBox(height: 8.h),
        CustomTextField(
            validator: (value) {

            },
            controller: _searchController,
            hintText: "What do you need help with today?",
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
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce!.cancel();
              debounce = Timer(Duration(milliseconds: 500), () {
                freelancerController.hubs.clear();

                freelancerController.getHubs(search: _searchController.text);

              });
            }

        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Column(
        children: [
          _isSearching ? SizedBox(height: 8.h) :  Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                  text: Get.arguments["role"] == "freelancer" ? "Hubs in your area" : "On going hub in your area", left: 20.w, bottom: 12.h)),
          Expanded(
            child: Obx(() => freelancerController.getHubsLoading.value ? CustomShimmer() :
            freelancerController.hubs.isEmpty ? CustomText(text: "No Data Found!",) :
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: freelancerController.hubs.length,
              itemBuilder: (context, index) {
                var hub = freelancerController.hubs[index];
                return Padding(
                  padding:
                  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                  child: ShopTaskCard(
                    imagePath:
                    "${ApiConstants.imageBaseUrl}${hub.image}",
                    taskTitle: "${hub.taskTitle}",
                    taskType: "${hub.taskCategory}",
                    scheduledTime: "",
                    peopleJoined: "${hub.pepoleJoined} Neighbors joined",
                    organizer: "${hub.organizer}",
                    payAmount: "",
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
