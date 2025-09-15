import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:droke/views/widgets/shop_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/cachanetwork_image.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedIndex = 0; // 0: Pending, 1: In Progress, 2: Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: CustomText(
              text: "Task",
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
                            btnName: "n/a",
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
                                  btnName: "n/a"),
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
                                btnName: "Rate Freelancer",
                                BtnOnTap: () {
                                  showBottomSheet(
                                    backgroundColor: Colors.white,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 20.h),
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  child: CustomNetworkImage(
                                                    height: 100.h,
                                                    width: 100.w,
                                                    boxShape: BoxShape.circle,
                                                    imageUrl:
                                                        "https://randomuser.me/api/portraits/men/10.jpg",
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.02),
                                                  )),
                                              CustomText(
                                                  text: "David",
                                                  color:
                                                      AppColors.textColor3B3B3B,
                                                  fontSize: 20.h,
                                                  top: 10.h),
                                              CustomText(
                                                  text: "Personal Needs",
                                                  color:
                                                      AppColors.textColor3B3B3B,
                                                  fontSize: 16.h,
                                                  top: 4.h),
                                              CustomText(
                                                  text:
                                                      "How was your service today?",
                                                  color:
                                                      AppColors.textColorSecondary5EAAA8,
                                                  fontSize: 22.h,
                                                  top: 6.h),


                                              CustomText(
                                                  text:
                                                  "Dog walking in evening",
                                                  color:
                                                  AppColors.textColor3B3B3B,
                                                  fontSize: 12.h,
                                                  italic: true,
                                                  top: 4.h),


                                              CustomText(
                                                  text: "Service Today, 12:15 pm",
                                                  color:
                                                  AppColors.textColor3B3B3B,
                                                  fontSize: 12.h,
                                                  bottom: 33.h,
                                                  top: 4.h),





                                              Align(
                                                alignment: Alignment.center,
                                                child: RatingBar.builder(
                                                  initialRating: 3,
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemSize: 30,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.red,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                              ),


                                              SizedBox(height: 45.h),



                                              CustomButton(title: "Submit", onpress: (){}, width: 293.w, height: 40.h),





                                              SizedBox(height: 80.h)
                                            ],
                                          ),
                                        );
                                      });
                                },
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
