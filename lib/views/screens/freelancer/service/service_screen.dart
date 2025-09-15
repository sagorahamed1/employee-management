import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/shop_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/cachanetwork_image.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _selectedIndex = 0; // 0: Pending, 1: In Progress, 2: Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: CustomText(
              text: "Service",
              fontSize: 22.h,
              color: AppColors.textColorSecondary5EAAA8)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                // Pending Button
                Expanded(
                  child: CustomButton(
                    loaderIgnore: true,
                    height: 35.h,
                    fontSize: 12.h,
                    color: _selectedIndex == 0
                        ? AppColors.textColorSecondary5EAAA8
                        : Colors.transparent,
                    titlecolor: _selectedIndex == 0
                        ? Colors.white
                        : AppColors.textColorSecondary5EAAA8,
                    boderColor: _selectedIndex == 0
                        ? Colors.transparent
                        : AppColors.textColorSecondary5EAAA8,
                    title: "Pending",
                    onpress: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                ),

                SizedBox(width: 8.w),

                // In Progress Button
                Expanded(
                  child: CustomButton(
                    loaderIgnore: true,
                    height: 35.h,
                    fontSize: 12.h,
                    color: _selectedIndex == 1
                        ? AppColors.textColorSecondary5EAAA8
                        : Colors.transparent,
                    titlecolor: _selectedIndex == 1
                        ? Colors.white
                        : AppColors.textColorSecondary5EAAA8,
                    boderColor: _selectedIndex == 1
                        ? Colors.transparent
                        : AppColors.textColorSecondary5EAAA8,
                    title: "In Progress",
                    onpress: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                ),

                SizedBox(width: 8.w),

                // Completed Button
                Expanded(
                  child: CustomButton(
                    loaderIgnore: true,
                    height: 35.h,
                    fontSize: 12.h,
                    color: _selectedIndex == 2
                        ? AppColors.textColorSecondary5EAAA8
                        : Colors.transparent,
                    titlecolor: _selectedIndex == 2
                        ? Colors.white
                        : AppColors.textColorSecondary5EAAA8,
                    boderColor: _selectedIndex == 2
                        ? Colors.transparent
                        : AppColors.textColorSecondary5EAAA8,
                    title: "Completed",
                    onpress: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // TODO : <<< ==========  List view ========>>>

            _selectedIndex == 0
                ? Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ShopTaskCard(
                      imagePath:
                      "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                      taskTitle: "Grocery run to Trader Joe's",
                      taskType: "Personal Needs",
                      scheduledTime: "9:30AM Today",
                      peopleJoined: "3 Neighbors joined",
                      organizer: "Maria from Pine Street",
                      payAmount: "\$5",
                      btnName: "Start",
                    ),
                  );
                },
              ),
            )
                : _selectedIndex == 1
                ? Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ShopTaskCard(
                        imagePath:
                        "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                        taskTitle: "Grocery run to Trader Joe's",
                        taskType: "Personal Needs",
                        scheduledTime: "9:30AM Today",
                        peopleJoined: "3 Neighbors joined",
                        organizer: "Maria from Pine Street",
                        payAmount: "\$5",
                        btnName: "Complete"),
                  );
                },
              ),
            )
                : Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ShopTaskCard(
                      imagePath:
                      "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                      taskTitle: "Grocery run to Trader Joe's",
                      taskType: "Personal Needs",
                      scheduledTime: "9:30AM Today",
                      peopleJoined: "3 Neighbors joined",
                      organizer: "Maria from Pine Street",
                      payAmount: "\$5",
                      btnName: "n/a",
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
