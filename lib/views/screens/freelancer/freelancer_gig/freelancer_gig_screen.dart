import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button.dart';

class FreelancerGigScreen extends StatefulWidget {
  FreelancerGigScreen({super.key});

  @override
  State<FreelancerGigScreen> createState() => _FreelancerGigScreenState();
}

class _FreelancerGigScreenState extends State<FreelancerGigScreen> {
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController rentCtrl = TextEditingController();
  int startHour = 10, startMinute = 0, endHour = 4, endMinute = 0;
  String startPeriod = 'AM', endPeriod = 'PM';
  List<int> hours = List.generate(12, (index) => index + 1);
  List<int> minutes = List.generate(60, (index) => index);
  List<String> periods = ['AM', 'PM'];


  final List<String> _options = ['Personal Needs', "Contractor level service", "Travel related service"];
  String _selected = 'Personal Needs';


  final List<String> rentOptions = ['Daily', "Weekly", "Monthly"];
  String rentSelected = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: SizedBox(),
          title: CustomText(
              text: "Freelancer Gig",
              fontSize: 22.h,
              color: AppColors.textColorSecondary5EAAA8),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: ContainedTabBarView(
            tabBarProperties: TabBarProperties(
              height: 45.h,
              indicatorColor: AppColors.textColorSecondary5EAAA8,
              indicatorWeight: 3,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              labelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 14.sp),
            ),
            tabs: const [
              Text('                 Create Gig           '),
              Text('                  My Gig                  '),
            ],
            views: [


              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 18.h),
                  decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 28.h),
                        Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                              "assets/images/serviceImage1.png",
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover),
                        ),
                        CustomText(
                            text: "Choose Service Category",
                            fontSize: 16.h,
                            top: 16.h,
                            bottom: 8.h),



                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 35.h,
                            padding:  EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.textColorSecondary5EAAA8,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selected,
                                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                style: const TextStyle(color: AppColors.textColor3B3B3B),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  }
                                },
                                items: _options.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),




                        CustomTextField(
                            controller: descriptionCtrl,
                            labelText: "Description",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                            hintText: "Description"),
                        CustomTextField(
                            controller: titleCtrl,
                            labelText: "Service Title",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                            hintText: "service title"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildPicker(
                              items: hours,
                              selected: startHour,
                              onChanged: (val) =>
                                  setState(() => startHour = val),
                              decoration: pickerDecoration,
                            ),
                            SizedBox(width: 3.w),
                            _buildPicker(
                              items: minutes,
                              selected: startMinute,
                              onChanged: (val) =>
                                  setState(() => startMinute = val),
                              decoration: pickerDecoration,
                            ),
                            SizedBox(width: 3.w),
                            _buildPicker(
                              items: periods,
                              selected: startPeriod,
                              onChanged: (val) =>
                                  setState(() => startPeriod = val),
                              decoration: pickerDecoration,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 7.w),
                              child: Text('-',
                                  style: TextStyle(
                                      fontSize: 20.h,
                                      color: AppColors
                                          .textColorSecondary5EAAA8)),
                            ),
                            _buildPicker(
                              items: hours,
                              selected: endHour,
                              onChanged: (val) =>
                                  setState(() => endHour = val),
                              decoration: pickerDecoration,
                            ),
                            SizedBox(width: 3.w),
                            _buildPicker(
                              items: minutes,
                              selected: endMinute,
                              onChanged: (val) =>
                                  setState(() => endMinute = val),
                              decoration: pickerDecoration,
                            ),
                            SizedBox(width: 3.w),
                            _buildPicker(
                              items: periods,
                              selected: endPeriod,
                              onChanged: (val) =>
                                  setState(() => endPeriod = val),
                              decoration: pickerDecoration,
                            ),
                          ],
                        ),
                        CustomText(
                            text: "Location",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            top: 12.h,
                            bottom: 8.h),
                        CustomButton(
                            color: AppColors.textColorSecondary5EAAA8,
                            boderColor: AppColors.textColorSecondary5EAAA8,
                            height: 40.h,
                            title: "Use my current location",
                            onpress: () {}),


                        SizedBox(height: 12.h),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 35.h,
                            padding:  EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.bgColorWhite,
                              border: Border.all(color: AppColors.textColorSecondary5EAAA8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: rentSelected,
                                icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                style: const TextStyle(color: AppColors.textColor3B3B3B),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      rentSelected = newValue;
                                    });
                                  }
                                },
                                items: rentOptions.map((String x) {
                                  return DropdownMenuItem<String>(
                                    value: x,
                                    child: Text(x),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),



                        SizedBox(height: 35.h),

                        CustomButton(
                            height: 45.h,
                            title: "Create Gig", onpress: () {

                        }),

                        SizedBox(height: 10.h)

                      ],
                    ),
                  ),
                ),
              ),






              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 18.h),
                  decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 28.h),
                        Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                              "assets/images/serviceImage1.png",
                              height: 100.h,
                              width: 100.w,
                              fit: BoxFit.cover),
                        ),
                        CustomText(
                            text: "I’m David, your go-to helping hand for everyday tasks around the neighborhood. I’m available for grocery shopping, dog walking, laundry pickup, pharmacy runs, and other daily errands you might need help with.",
                            fontSize: 12.h,
                            textAlign: TextAlign.start,
                            maxline: 15,
                            top: 16.h,
                            bottom: 8.h),



                        keyValueText(
                          keyText: "Freelancer",
                          valueText: "Sagor"
                        ),

                        keyValueText(
                            keyText: "Service Title",
                            valueText: "Grocery run to trader Joe's"
                        ),



                        keyValueText(
                            keyText: "Service Category",
                            valueText: "Personal Needs"
                        ),

                        keyValueText(
                            keyText: "Available Time",
                            valueText: "10:00Am - 4:00PM"
                        ),


                        keyValueText(
                            keyText: "Location",
                            valueText: "Pine Street"
                        ),



                        keyValueText(
                            keyText: "Rent",
                            valueText: "25\$"
                        ),


                        keyValueText(
                            keyText: "Rating",
                            valueText: "★★★★"
                        ),






                        SizedBox(height: 35.h),

                        CustomButton(
                            height: 45.h,
                            title: "Set Schedule", onpress: () {

                              Get.toNamed(AppRoutes.setScheduleScreen);

                        }),

                        SizedBox(height: 10.h)

                      ],
                    ),
                  ),
                ),
              ),
            ],
            onChange: (index) => print("Tab index changed to $index"),
          ),
        ));
  }

  keyValueText({required String keyText, valueText}){
    return                  Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          SizedBox(
              width: 120.w,
              child: CustomText(text: "$keyText", textAlign: TextAlign.start)),


          CustomText(text: ":  $valueText", italic: true)
        ],
      ),
    );
  }

  final pickerDecoration = BoxDecoration(
    border: Border.all(color: Colors.teal),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.r),
  );

  Widget _buildPicker<T>({
    required List<T> items,
    required T selected,
    required ValueChanged<T> onChanged,
    required BoxDecoration decoration,
  }) {
    return Container(
      width: 40.w,
      height: 45.h,
      decoration: decoration,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: items.indexOf(selected),
        ),
        itemExtent: 27,
        onSelectedItemChanged: (index) => onChanged(items[index]),
        children: items
            .map((e) => Center(
                  child: Text(
                    e.toString().padLeft(2, '0'),
                    style: TextStyle(fontSize: 11.r),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
