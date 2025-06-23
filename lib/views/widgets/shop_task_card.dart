
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
  final String? btnName;
  final bool selected;
  final bool ignoreJoinBtn;

  const ShopTaskCard({
    Key? key,
    this.imagePath,
    this.taskTitle,
    this.taskType,
    this.scheduledTime,
    this.peopleJoined,
    this.organizer,
    this.payAmount,
    this.btnName = "Join",
    this.selected = false,
    this.ignoreJoinBtn = false
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


                    ignoreJoinBtn ?
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black87)
                            ),
                            child: Row(
                              children: [
                                CustomText(text: "4", fontSize: 11.h, left: 8.w, right: 6.w),
                                Icon(Icons.group, size: 11.h),
                                SizedBox(width: 8.w),
                              ],
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Container(
                            height: 8.h,
                            width: 90.w,
                            color: AppColors.primaryColor,
                          ),
                          Container(
                            height: 8.h,
                            width: 40.w,
                            color: AppColors.textColor3B3B3B,
                          ),


                          SizedBox(width: 10.w),


                          Container(
                            height: 16.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: selected ?  AppColors.primaryColor : Colors.black87)
                            ),
                            child: Center(
                              child: Container(
                                height: 8.h,
                                width: 8.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selected ? AppColors.primaryColor : Colors.transparent
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ) :

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
                                text: "$btnName",
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
              text: label.toString(),
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
