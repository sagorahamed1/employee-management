import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/shop_task_card.dart';

class HubScreen extends StatefulWidget {
  HubScreen({super.key});

  @override
  State<HubScreen> createState() =>
      _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  bool _isSearching = false;

  // <--- track search state
  TextEditingController _searchController = TextEditingController();

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
        title: _isSearching
            ? _buildSearchField()
            : CustomText(
          text: "Available Hubs",
          fontSize: 22.h,
          color: AppColors.textColorSecondary5EAAA8,
        ),
        actions: [

          _isSearching ? SizedBox() : Assets.images.addhubImage.image() ,


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
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [


            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 12.h),
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
                
                
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Sagor Ahamed ", bottom: 6.h, fontWeight: FontWeight.w500),
                                    CustomText(text: "Alex invited you to their group.", fontSize: 12.h, fontWeight: FontWeight.w300),
                                  ],
                                ),
                              ),
                
                
                
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 45.h),
                                    child: CustomText(
                                        text: "11:58 PM",
                                        fontSize: 9.h),
                                  ))
                
                
                            ],
                          ),
                        ),
                      ),
                    );
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
