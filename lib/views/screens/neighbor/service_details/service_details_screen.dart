import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceDetailsScreen extends StatefulWidget {
  ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController taskTypeCtrl = TextEditingController();
  bool isDropDown = false;
  String _selectedPeriod = 'Daily';
  var dropDownList = [
    "Grocery Shopping",
    "Dog Walking",
    "Laundry Pickup",
    "Pharmacy Pickup",
    "Errands and other regular tasks"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Available Hubs",
          fontSize: 22.h,
          color: AppColors.textColorSecondary5EAAA8,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 3,
                        offset: Offset(-2, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(18.r)),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Stack(
                    children: [


                      if (isDropDown)
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () {
                              isDropDown = false;
                              setState(() {});
                            },
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: CustomText(
                                  text: "Personal Needs",
                                  fontSize: 16.h,
                                  bottom: 8.h)),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Image.asset("assets/images/serviceImage1.png",
                                height: 172.h,
                                width: double.infinity,
                                fit: BoxFit.cover),
                          ),
                          CustomText(
                              maxline: 50,
                              textAlign: TextAlign.start,
                              bottom: 12.h,
                              top: 10.h,
                              text:
                              "The Daily Needs section of Neighbor Hubs connects community members with trusted local gig workers for common, everyday tasks. Whether you're short on time, temporarily unable to run errands, or just looking for a helping hand, Daily Needs makes it easy to get things done through your own neighborhood network."),

                          CustomTextField(
                            controller: nameCtrl,
                            hintText: "Create Hub Name",
                            labelText: "Hub name",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                          ),

                          CustomTextField(
                            controller: nameCtrl,
                            hintText: "Select Task Type",
                            labelText: "Task Type",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                            onTap: () {
                              isDropDown= !isDropDown;
                              setState(() {});
                            },
                            readOnly: true,
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                          ),

                          isDropDown
                              ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                            height: 200.h,
                            child: ListView.builder(
                              itemCount: dropDownList.length,
                              itemBuilder: (context, index) {
                                var dropDownItems = dropDownList[index];
                                return GestureDetector(
                                  onTap: () {
                                    isDropDown = false;
                                    taskTypeCtrl.text = dropDownItems;
                                    setState(() {});
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(height: index == 0 ? 8.h : 0),
                                      CustomText(
                                          text: dropDownItems,
                                          textAlign: TextAlign.center),
                                      Divider()
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                              : const SizedBox(),

                          CustomText(
                              text: "Frequency of the task",
                              fontSize: 16.h,
                              bottom: 12.h),

                          // TODO : <<< ==========  Two Button ========>>>

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  height: 35.h,
                                  fontSize: 10.h,
                                  color: _selectedPeriod == 'Daily'
                                      ? AppColors.textColorSecondary5EAAA8
                                      : Colors.white,
                                  titlecolor: _selectedPeriod == 'Daily'
                                      ? Colors.white
                                      : AppColors.textColor3B3B3B,
                                  boderColor: AppColors.textColorSecondary5EAAA8,
                                  title: "Daily",
                                  onpress: () {
                                    setState(() {
                                      _selectedPeriod = 'Daily';
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 7.w),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  height: 35.h,
                                  fontSize: 10.h,
                                  color: _selectedPeriod == 'Weekly'
                                      ? AppColors.textColorSecondary5EAAA8
                                      : Colors.white,
                                  titlecolor: _selectedPeriod == 'Weekly'
                                      ? Colors.white
                                      : AppColors.textColor3B3B3B,
                                  boderColor: AppColors.textColorSecondary5EAAA8,
                                  title: "Weekly",
                                  onpress: () {
                                    setState(() {
                                      _selectedPeriod = 'Weekly';
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 7.w),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  height: 35.h,
                                  fontSize: 10.h,
                                  color: _selectedPeriod == 'Monthly'
                                      ? AppColors.textColorSecondary5EAAA8
                                      : Colors.white,
                                  titlecolor: _selectedPeriod == 'Monthly'
                                      ? Colors.white
                                      : AppColors.textColor3B3B3B,
                                  boderColor: AppColors.textColorSecondary5EAAA8,
                                  title: "Monthly",
                                  onpress: () {
                                    setState(() {
                                      _selectedPeriod = 'Monthly';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 35.h),

                          CustomButton(title: "Create Hubs", onpress: () {}),

                          SizedBox(height: 12.h)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
