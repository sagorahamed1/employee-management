
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_constants/app_colors.dart';
import 'cachanetwork_image.dart';
import 'custom_text.dart';

class ShopTaskCard extends StatelessWidget {
  final String? imagePath;
  final String? taskTitle;
  final String? taskType;
  final String? scheduledTime;
  final String? peopleJoined;
  final String? organizer;
  final String? payAmount;

  const ShopTaskCard({
    Key? key,
    this.imagePath,
    this.taskTitle,
    this.taskType,
    this.scheduledTime,
    this.peopleJoined,
    this.organizer,
    this.payAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryColor),
        color: Color(0x17D46A6A),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CustomNetworkImage(
                  height: 107.5.h,
                  width: 93.w,
                  imageUrl: "$imagePath",
                  border: Border.all(color: Colors.grey, width: 0.02),
                )),
            SizedBox(width: 10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow("Task Title", taskTitle ?? ""),
                    _buildRow("Task Type", taskType ?? ""),
                    _buildRow("Scheduled Time", scheduledTime ?? ""),
                    _buildRow("People Joined", peopleJoined ?? ""),
                    _buildRow("Organizer", organizer ?? ""),
                    _buildRow("You pay", payAmount ?? ""),

                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.primaryColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 4.h),
                            child: CustomText(
                                text: "Join",
                                color: Colors.white,
                                fontSize: 9.h),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.w,
            child: CustomText(
              textAlign: TextAlign.start,
              text: "$label",
              fontWeight: FontWeight.w600,
              fontSize: 10.h,
            ),
          ),
          Expanded(
            child: CustomText(
              text: ":  $value",
              textAlign: TextAlign.start,
              fontSize: 10.h,
            ),
          ),
        ],
      ),
    );
  }
}
