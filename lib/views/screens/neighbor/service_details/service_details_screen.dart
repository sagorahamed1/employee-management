

import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';

import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../core/config/app_route.dart';
import '../../../../services/api_client.dart';
import '../../../../services/api_constants.dart';
import '../../../widgets/cachanetwork_image.dart';

class ServiceDetailsScreen extends StatefulWidget {
  ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {

  NeighborController neighborController = Get.find<NeighborController>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController taskTypeCtrl = TextEditingController();
  bool isDropDown = false;
  String _selectedPeriod = 'daily';


  @override
  void initState() {
    var data = Get.arguments;
    neighborController.getServiceDetails(serviceId: data["id"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Service Details",
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
              Obx(() {
                var serviceDetails = neighborController.serviceDetails.value;
                return Container(
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
                                    text: "${serviceDetails.taskCategory}",
                                    fontSize: 16.h,
                                    bottom: 8.h)),
                            // Container(
                            //   clipBehavior: Clip.antiAlias,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(12.r)),
                            //   child: Image.asset("assets/images/serviceImage1.png",
                            //       height: 172.h,
                            //       width: double.infinity,
                            //       fit: BoxFit.cover),
                            // ),


                            CustomNetworkImage(
                                borderRadius: BorderRadius.circular(10.r),
                                imageUrl:
                                "${ApiConstants.imageBaseUrl}/${serviceDetails.image}",
                                width: double.infinity,
                                height: 172.h),


                            CustomText(
                                maxline: 50,
                                textAlign: TextAlign.start,
                                bottom: 12.h,
                                top: 10.h,
                                text:
                                "${serviceDetails.description}"),



                            Get.arguments["role"] == "freelancer" ?

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CustomText(
                                    text: "Services",
                                    fontSize: 16.h,
                                    bottom: 12.h),

                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: serviceDetails.taskList?.length,
                                    itemBuilder: (context, index) {
                                      return  CustomText(text: "    • ${serviceDetails.taskList?[index]}", fontSize: 12.h, italic: true, textAlign: TextAlign.start);
                                    },
                                ),




                                SizedBox(height: 40.h),


                                CustomButton(title: "Explore hubs", onpress: (){



                                    Get.toNamed(AppRoutes.freelancerHubSearchScreen, arguments: {
                                      "role" : "freelancer",
                                      "category" : "${serviceDetails.taskCategory}"
                                    });




                                })


                              ],
                            )

                                :

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CustomTextField(
                                  controller: nameCtrl,
                                  hintText: "Create Hub Name",
                                  labelText: "Hub name",
                                  borderColor: AppColors.textColorSecondary5EAAA8,
                                ),

                                CustomTextField(
                                  controller: taskTypeCtrl,
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
                                    itemCount: serviceDetails.taskList?.length,
                                    itemBuilder: (context, index) {
                                      var dropDownItems = serviceDetails.taskList?[index];
                                      return GestureDetector(
                                        onTap: () {
                                          isDropDown = false;
                                          taskTypeCtrl.text = dropDownItems ?? "";
                                          setState(() {});
                                        },
                                        child: Column(
                                          children: [
                                            SizedBox(height: index == 0 ? 8.h : 0),
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
                                        loaderIgnore: true,
                                        height: 35.h,
                                        fontSize: 9.h,
                                        color: _selectedPeriod == 'daily'
                                            ? AppColors.textColorSecondary5EAAA8
                                            : Colors.white,
                                        titlecolor: _selectedPeriod == 'daily'
                                            ? Colors.white
                                            : AppColors.textColor3B3B3B,
                                        boderColor: AppColors.textColorSecondary5EAAA8,
                                        title: "daily",
                                        onpress: () {
                                          setState(() {
                                            _selectedPeriod = 'daily';
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        loaderIgnore: true,
                                        height: 35.h,
                                        fontSize: 9.h,
                                        color: _selectedPeriod == 'weekly'
                                            ? AppColors.textColorSecondary5EAAA8
                                            : Colors.white,
                                        titlecolor: _selectedPeriod == 'weekly'
                                            ? Colors.white
                                            : AppColors.textColor3B3B3B,
                                        boderColor: AppColors.textColorSecondary5EAAA8,
                                        title: "weekly",
                                        onpress: () {
                                          setState(() {
                                            _selectedPeriod = 'weekly';
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        loaderIgnore: true,
                                        height: 35.h,
                                        fontSize: 9.h,
                                        color: _selectedPeriod == 'monthly'
                                            ? AppColors.textColorSecondary5EAAA8
                                            : Colors.white,
                                        titlecolor: _selectedPeriod == 'monthly'
                                            ? Colors.white
                                            : AppColors.textColor3B3B3B,
                                        boderColor: AppColors.textColorSecondary5EAAA8,
                                        title: "monthly",
                                        onpress: () {
                                          setState(() {
                                            _selectedPeriod = 'monthly';
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),



                                SizedBox(height: 20.h),

                                CustomText(text: "Selected Hub Image", bottom: 12.h),
                                GestureDetector(
                                  onTap: _pickImageFromGallery,
                                  child: Container(
                                    height: 200.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: Colors.white,
                                    ),
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(15.r),
                                      dashPattern: const [10, 5],
                                      color: const Color(0xffCBD0DC),
                                      strokeWidth: 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.r),
                                        child: _image == null
                                            ? Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.cloud_upload_outlined, size: 30, color: Colors.black54),
                                                SizedBox(height: 8.h),
                                                Text(
                                                  "Choose a file",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xff333333),
                                                  ),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  "PNG, JPG & JPEG formats, up to 50MB",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: const Color(0xffA9ACB4),
                                                  ),
                                                ),
                                                SizedBox(height: 8.h),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8.r),
                                                    border: Border.all(color: Colors.grey.shade400),
                                                  ),
                                                  child: Text(
                                                    "Browse File",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                            : Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.memory(
                                              _image!,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              top: 8,
                                              right: 8,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _image = null;
                                                    selectedImage = null;
                                                  });
                                                },
                                                child: CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: Colors.black54,
                                                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 35.h),

                                CustomButton(title: "Create Hubs", onpress: () {



                                  var hubInfo = {
                                    "longitude" : "90.4139501156808",
                                    "latitude" : "23.790934543802027",
                                    "hubName" : "${nameCtrl.text}",
                                    "frequency" : "${_selectedPeriod}",
                                    "taskTitle" : "${taskTypeCtrl.text}"
                                  };



                                  neighborController.hubCreate(context: context,serviceId: data["id"], body: hubInfo, image: selectedImage);



                                }),

                              ],
                            ),

                            SizedBox(height: 12.h)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              )
            ],
          ),
        ),
      ),
    );
  }



  Uint8List? _image;
  File? selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }





}
