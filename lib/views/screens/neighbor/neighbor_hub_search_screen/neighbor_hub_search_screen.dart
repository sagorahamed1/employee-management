import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/shop_task_card.dart';

class NeighborHubSearchScreen extends StatefulWidget {
  NeighborHubSearchScreen({super.key});

  @override
  State<NeighborHubSearchScreen> createState() =>
      _NeighborHubSearchScreenState();
}

class _NeighborHubSearchScreenState extends State<NeighborHubSearchScreen> {
  bool _isSearching = false;

  // <--- track search state
  TextEditingController _searchController = TextEditingController();

  Widget _buildSearchField() {
    return Column(
      children: [
        SizedBox(height: 8.h),
        CustomTextField(
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
            onChanged: (value) {}),
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
                  text: "On going hub in your area", left: 20.w, bottom: 12.h)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                  child: ShopTaskCard(
                    imagePath:
                        "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                    taskTitle: "Grocery run to Trader Joe's",
                    taskType: "Personal Needs",
                    scheduledTime: "9:30AM Today",
                    peopleJoined: "3 Neighbors joined",
                    organizer: "Maria from Pine Street",
                    payAmount: "\$5",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
