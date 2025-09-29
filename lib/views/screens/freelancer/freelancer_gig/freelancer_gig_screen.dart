import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:droke/controller/neighbor/neighbor_controller.dart';
import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/cachanetwork_image.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:droke/views/widgets/no_data_found_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/freelancer/freelancer_controller.dart';
import '../../../widgets/custom_button.dart';

class FreelancerGigScreen extends StatefulWidget {
  FreelancerGigScreen({super.key});

  @override
  State<FreelancerGigScreen> createState() => _FreelancerGigScreenState();
}

class _FreelancerGigScreenState extends State<FreelancerGigScreen> {
  FreelancerController freelancerController = Get.find<FreelancerController>();
  NeighborController neighborController = Get.find<NeighborController>();

  int _selectedIndex = 0;
  String selectedCategory = '';
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController feeCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController rentCtrl = TextEditingController();
  int startHour = 10, startMinute = 0, endHour = 4, endMinute = 0;
  String startPeriod = 'AM', endPeriod = 'PM';
  List<int> hours = List.generate(12, (index) => index + 1);
  List<int> minutes = List.generate(60, (index) => index);
  List<String> periods = ['AM', 'PM'];
  bool isDropDown = false;

  @override
  void initState() {
    if (neighborController.services.isEmpty) {
      neighborController.getService();
    }
    super.initState();
  }

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
                          child: CustomNetworkImage(
                              imageUrl:
                                  "${ApiConstants.imageBaseUrl}${neighborController.services[_selectedIndex].image}",
                              height: 100.h,
                              width: 100.w),
                        ),
                        CustomText(
                            text: "Choose Service Category",
                            fontSize: 16.h,
                            top: 16.h,
                            bottom: 8.h),
                        Row(
                          children: [
                            // Pending Button
                            Expanded(
                              child: CustomButton(
                                loaderIgnore: true,
                                borderRadius: 12,
                                height: 35.h,
                                fontSize: 10.h,
                                loading: false,
                                color: _selectedIndex == 0
                                    ? AppColors.textColorSecondary5EAAA8
                                    : Colors.transparent,
                                titlecolor: _selectedIndex == 0
                                    ? Colors.white
                                    : AppColors.textColorSecondary5EAAA8,
                                boderColor: _selectedIndex == 0
                                    ? Colors.transparent
                                    : AppColors.textColorSecondary5EAAA8,
                                title: "Contractor",
                                onpress: () {
                                  setState(() {
                                    _selectedIndex = 0;
                                    selectedCategory = "Contractor";
                                    titleCtrl.clear();
                                  });
                                },
                              ),
                            ),

                            SizedBox(width: 8.w),

                            // In Progress Button
                            Expanded(
                              child: CustomButton(
                                borderRadius: 12,
                                loaderIgnore: true,
                                height: 35.h,
                                fontSize: 10.h,
                                loading: false,
                                color: _selectedIndex == 1
                                    ? AppColors.textColorSecondary5EAAA8
                                    : Colors.transparent,
                                titlecolor: _selectedIndex == 1
                                    ? Colors.white
                                    : AppColors.textColorSecondary5EAAA8,
                                boderColor: _selectedIndex == 1
                                    ? Colors.transparent
                                    : AppColors.textColorSecondary5EAAA8,
                                title: "Traveling",
                                onpress: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                    selectedCategory = "Traveling";
                                    titleCtrl.clear();
                                  });
                                },
                              ),
                            ),

                            SizedBox(width: 8.w),

                            // Completed Button
                            Expanded(
                              child: CustomButton(
                                loading: false,
                                borderRadius: 12,
                                loaderIgnore: true,
                                height: 35.h,
                                fontSize: 10.h,
                                color: _selectedIndex == 2
                                    ? AppColors.textColorSecondary5EAAA8
                                    : Colors.transparent,
                                titlecolor: _selectedIndex == 2
                                    ? Colors.white
                                    : AppColors.textColorSecondary5EAAA8,
                                boderColor: _selectedIndex == 2
                                    ? Colors.transparent
                                    : AppColors.textColorSecondary5EAAA8,
                                title: "Personal Need",
                                onpress: () {
                                  setState(() {
                                    _selectedIndex = 2;
                                    selectedCategory = "Personal";
                                    titleCtrl.clear();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                          controller: titleCtrl,
                          labelText: "Service Title",
                          borderColor: AppColors.textColorSecondary5EAAA8,
                          hintText: "service title",
                          onTap: () {
                            isDropDown = !isDropDown;
                            setState(() {});
                          },
                          readOnly: true,
                        ),
                        isDropDown
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r))),
                                height: 200.h,
                                child: ListView.builder(
                                  itemCount: neighborController
                                      .services[_selectedIndex]
                                      .taskList
                                      ?.length,
                                  itemBuilder: (context, index) {
                                    var dropDownItems = neighborController
                                        .services[_selectedIndex]
                                        .taskList?[index];
                                    titleCtrl.text = neighborController
                                        .services[_selectedIndex].id
                                        .toString();
                                    return GestureDetector(
                                      onTap: () {
                                        isDropDown = false;
                                        titleCtrl.text = dropDownItems ?? "";
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: index == 0 ? 8.h : 0),
                                          CustomText(
                                              text: dropDownItems ?? "",
                                              textAlign: TextAlign.center),
                                          Divider()
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                        CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: feeCtrl,
                            labelText: "Amount",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                            hintText: "Amount"),
                        CustomTextField(
                            controller: descriptionCtrl,
                            labelText: "Description",
                            borderColor: AppColors.textColorSecondary5EAAA8,
                            hintText: "Description"),
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
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: Text('-',
                                  style: TextStyle(
                                      fontSize: 20.h,
                                      color:
                                          AppColors.textColorSecondary5EAAA8)),
                            ),
                            _buildPicker(
                              items: hours,
                              selected: endHour,
                              onChanged: (val) => setState(() => endHour = val),
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
                        SizedBox(height: 35.h),
                        CustomButton(
                            height: 45.h,
                            title: "Create Gig",
                            onpress: () {
                              Map<String, dynamic> data = {
                                "category": "${selectedCategory}",
                                "serviceTittle": "${titleCtrl.text}",
                                "description": "${descriptionCtrl.text}",
                                "timeSlot":
                                    "${startHour}:${startMinute} ${startPeriod} - ${endHour}:${endMinute} ${endPeriod}",
                                "location": {
                                  "type": "Point",
                                  "coordinates": [90.413, 23.456]
                                },
                                "fee": feeCtrl.text
                              };

                              freelancerController.gigCreate(body: data);
                            }),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Obx(
                () => freelancerController.gigLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : freelancerController.gig.isEmpty
                        ? NoDataFoundCard()
                        : ListView.builder(
                            itemCount: freelancerController.gig.length,
                            itemBuilder: (context, index) {
                              var gig = freelancerController.gig[index];
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 18.h),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 28.h),
                                      Container(
                                        width: double.infinity,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: CustomNetworkImage(
                                            imageUrl:
                                                "${ApiConstants.imageBaseUrl}${gig.image}",
                                            height: 100.h,
                                            width: 100.w),
                                      ),
                                      CustomText(
                                          text: "${gig.description}",
                                          fontSize: 12.h,
                                          textAlign: TextAlign.start,
                                          maxline: 15,
                                          top: 16.h,
                                          bottom: 8.h),
                                      keyValueText(
                                          keyText: "Freelancer",
                                          valueText: "${gig.name}"),
                                      keyValueText(
                                          keyText: "Service Title",
                                          valueText: "${gig.serviceType}"),
                                      keyValueText(
                                          keyText: "Service Category",
                                          valueText: "${gig.category}"),
                                      keyValueText(
                                          keyText: "Available Time",
                                          valueText: "${gig.timeSlot}"),
                                      keyValueText(
                                          keyText: "Location",
                                          valueText: "${gig.location}"),
                                      keyValueText(
                                          keyText: "Rent",
                                          valueText: "${gig.fee}"),
                                      keyValueText(
                                          keyText: "Rating", valueText: "★★★★"),
                                      SizedBox(height: 10.h)
                                    ],
                                  ),
                                ),
                              );
                            }),
              ))
            ],
            onChange: (index) {
              if (index == 1) {
                freelancerController.gig.value = [];
                freelancerController.geGig();
              }

              print("======================$index");
            },
          ),
        ));
  }

  keyValueText({required String keyText, valueText}) {
    return Padding(
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
