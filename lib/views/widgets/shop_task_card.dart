
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_constants/app_colors.dart';
import 'cachanetwork_image.dart';
import 'custom_text.dart';

class ShopTaskCard extends StatelessWidget {
  final String? imagePath;
  final String? taskTitle;
  final String? taskType;
  final String? hubName;
  final String? scheduledTime;
  final String? peopleJoined;
  final String? organizer;
  final String? payAmount;
  final String? btnName;
  final bool selected;
  final bool ignoreJoinBtn;
  final VoidCallback? BtnOnTap;
  final VoidCallback? onTap;

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
    this.ignoreJoinBtn = false, this.BtnOnTap, this.onTap, this.hubName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryColor),
          color: Color(0xffF4F1EE),
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
                    hubName == ""  ? SizedBox() :  _buildRow("Hub Name", hubName ?? ""),
                    scheduledTime == ""  ? SizedBox() :  _buildRow("Scheduled Time", scheduledTime ?? ""),
                      peopleJoined == ""  ? SizedBox() : _buildRow("People Joined", peopleJoined ?? ""),
                      organizer == ""  ? SizedBox() : _buildRow("Organizer", organizer ?? ""),
                      payAmount == ""  ? SizedBox() :  _buildRow("You pay", payAmount ?? ""),


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



                           Spacer(),


                            GestureDetector(
                              onTap: BtnOnTap,
                              child: Container(
                                height: 22.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: selected ?  AppColors.primaryColor : Colors.black87)
                                ),
                                child: Center(
                                  child: Container(
                                    height: 12.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selected ? AppColors.primaryColor : Colors.transparent
                                    ),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ) :

                    btnName == "n/a" ? SizedBox() :  Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: BtnOnTap,
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
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
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
