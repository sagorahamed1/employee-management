import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/cachanetwork_image.dart';

class SetScheduleScreen extends StatefulWidget {
  const SetScheduleScreen({super.key});

  @override
  State<SetScheduleScreen> createState() => _SetScheduleScreenState();
}

class _SetScheduleScreenState extends State<SetScheduleScreen> {


  int startHour = 10, startMinute = 0, endHour = 4, endMinute = 0;
  String startPeriod = 'AM', endPeriod = 'PM';
  List<int> hours = List.generate(12, (index) => index + 1);
  List<int> minutes = List.generate(60, (index) => index);
  List<String> periods = ['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(text: "Schedule", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8),
      ),



      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [




            Row(
              children: [


                CustomText(text: "Available Time", color: Colors.black,fontWeight: FontWeight.w500),

                Spacer(),


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
              ],
            ),


            SizedBox(height: 24.h),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.cardColorEBEBEB),
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomNetworkImage(
                                  height: 64.h,
                                  width: 64.w,
                                  borderRadius: BorderRadius.circular(6.r),
                                  imageUrl:
                                  "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                                  border: Border.all(
                                      color: Colors.grey, width: 0.02),
                                )),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "Grocery Shopping",
                                    color: Colors.black,
                                    fontSize: 12.h),
                                SizedBox(height: 6.h),
                                CustomText(text: "(hub name)", fontSize: 9.h),
                              ],
                            ),
                            Spacer(),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 4.h),
                                  child: CustomText(
                                      text: "10:15 AM", color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),



            CustomButton(title: "Set Schedule", onpress: () {

            }),


            SizedBox(height: 44.h)

          ],
        ),
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
      width: 35.w,
      height: 30.h,
      decoration: decoration,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: items.indexOf(selected),
        ),
        itemExtent: 16,
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
