import 'dart:async';

import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../../global/custom_assets/assets.gen.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class InviteScreen extends StatefulWidget {
   InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {

  NeighborController neighborController = Get.find<NeighborController>();
  final TextEditingController searchCtrl = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   double minPrice = 5;
   double maxPrice = 20;
  Timer? debounce;


   @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
       neighborController.getNearNeighbors();
     });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     var data = Get.arguments;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 5,
          shadowColor: Colors.black,
          title: CustomText(text: "Invite via Location", fontSize: 20.h),

        actions: [
          GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              child: Assets.icons.filterIcon.svg()),

          SizedBox(width: 24.w)
        ],
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [

            SizedBox(height: 20.h),


            CustomTextField(
                prefixIcon: Icon(Icons.search),
                controller: searchCtrl,
                borderColor: AppColors.primaryColor,
                hintextColor: Colors.black87,
                hintText: "Search",
                validator: (value) {

                },
                onChanged: (value) {
                  if (debounce?.isActive ?? false) debounce!.cancel();
                  debounce = Timer(Duration(milliseconds: 500), () {
                    neighborController.nearNeighbors.value = [];

                    neighborController.getNearNeighbors(search: searchCtrl.text);

                  });
                }

            ),



            Expanded(
              child: Obx(() =>
              neighborController.getNearLoading.value ? CustomShimmer() :
              neighborController.nearNeighbors.isEmpty ? CustomText(text: "No Data Found!") :
                 ListView.builder(
                  itemCount: neighborController.nearNeighbors.length,
                  itemBuilder: (context, index) {
                    var neighbor = neighborController.nearNeighbors[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 12.h),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.cardColorEBEBEB
                        ),

                        child: Padding(
                          padding:  EdgeInsets.all(12.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [

                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CustomNetworkImage(
                                    height: 45.h,
                                    width: 45.w,
                                    boxShape: BoxShape.circle,
                                    imageUrl: "${ApiConstants.imageBaseUrl}${neighbor.image}",
                                    border: Border.all(color: Colors.grey, width: 0.02),
                                  )),

                              SizedBox(width: 12.w),


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "${neighbor.name}", color: Colors.black),
                                  CustomText(text: "${neighbor.email}", fontSize: 12.h, color: Colors.black),
                                ],
                              ),

                              Spacer(),

                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      neighborController.invite(receiverEmail: neighbor.email.toString(), hubId: data["hubId"]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6.r),
                                          color: AppColors.primaryColor,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.black38,
                                            offset: Offset(-3, 3)
                                          )
                                        ]
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                        child: CustomText(
                                            text: "Invite", color: Colors.white),
                                      ),
                                    ),
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


      endDrawer: SizedBox(
        width: 300.w,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [

                Row(
                  children: [

                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),


                    CustomText(
                        text: "Filter",
                        fontSize: 20.h,
                        left: 80.w,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorSecondary5EAAA8),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Price Range
                CustomText(text: "Kilometer From Me", color: AppColors.textColorSecondary5EAAA8, textAlign: TextAlign.start),


                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.textColorSecondary5EAAA8,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: AppColors.textColorSecondary5EAAA8,
                  ),
                  child: RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 100,
                    divisions: 20,
                    onChanged: (values) {
                      setState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        CustomText(text: "Minimum", fontSize: 12.h, bottom: 6.h),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.textColorSecondary5EAAA8),
                              borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                              child: Text("${minPrice.toInt()}"),
                            )),
                      ],
                    ),



                    Column(
                      children: [

                        CustomText(text: "Maximum", fontSize: 12.h, bottom: 6.h),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.textColorSecondary5EAAA8),
                                borderRadius: BorderRadius.circular(10.r)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                              child: Text("${maxPrice.toInt()}"),
                            )),
                      ],
                    ),

                  ],
                ),

                SizedBox(height: 60.h),
                
                
                



                /// Apply Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomButton(
                    height: 35.h,
                    title: "Apply",
                    onpress: () {
                      // Apply filter logic here
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
