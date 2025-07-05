import 'dart:io';

import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/custom_assets/assets.gen.dart';
import '../../widgets/custom_button.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  int _selectedIndex = 0;
  int _selectedIndexFrequency = 0;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        title: CustomText(text: "Create Task", fontSize: 22.h,color: AppColors.textColorSecondary5EAAA8),
      ),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
          
          
          
              Container(
                height: 170.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColorSecondary5EAAA8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/uploadImage.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _images.isEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImages,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.textColorSecondary5EAAA8)
                        ),
                          child: Padding(
                            padding:  EdgeInsets.all(10.r),
                            child: Icon(Icons.add, color: AppColors.textColorSecondary5EAAA8, size: 22.h),
                          )),
                    ),
                    SizedBox(height: 10.h),
                  ],
                )
                    : Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          _images[_currentIndex],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Remove Icon
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => _removeImage(_currentIndex),
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.close,
                                size: 14.r, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
          
              CustomText(text: "Choose Task Category", fontSize: 16.h, color: Colors.black, top: 20.h),
          
              SizedBox(height: 12.h),
          
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
                      title: "Personal Needs",
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
                      title: "Contractor Level task",
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
                      title: "Travel Related",
                      onpress: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 12.h),
              CustomTextField(controller: nameCtrl, hintText: "Create Hub Name", labelText: "Hub name"),
              CustomTextField(controller: titleCtrl, hintText: "Enter title", labelText: "Task Title"),
              CustomTextField(controller: descriptionCtrl, hintText: "Write description", labelText: "Task Description"),
          
          
          
          
              CustomText(text: "Frequency of the task", fontSize: 16.h, color: Colors.black),
          
              SizedBox(height: 12.h),
          
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
                      color: _selectedIndexFrequency == 0
                          ? AppColors.textColorSecondary5EAAA8
                          : Colors.transparent,
                      titlecolor: _selectedIndexFrequency == 0
                          ? Colors.white
                          : AppColors.textColorSecondary5EAAA8,
                      boderColor: _selectedIndexFrequency == 0
                          ? Colors.transparent
                          : AppColors.textColorSecondary5EAAA8,
                      title: "Daily",
                      onpress: () {
                        setState(() {
                          _selectedIndexFrequency = 0;
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
                      color: _selectedIndexFrequency == 1
                          ? AppColors.textColorSecondary5EAAA8
                          : Colors.transparent,
                      titlecolor: _selectedIndexFrequency == 1
                          ? Colors.white
                          : AppColors.textColorSecondary5EAAA8,
                      boderColor: _selectedIndexFrequency == 1
                          ? Colors.transparent
                          : AppColors.textColorSecondary5EAAA8,
                      title: "Weekly",
                      onpress: () {
                        setState(() {
                          _selectedIndexFrequency = 1;
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
                      color: _selectedIndexFrequency == 2
                          ? AppColors.textColorSecondary5EAAA8
                          : Colors.transparent,
                      titlecolor: _selectedIndexFrequency == 2
                          ? Colors.white
                          : AppColors.textColorSecondary5EAAA8,
                      boderColor: _selectedIndexFrequency == 2
                          ? Colors.transparent
                          : AppColors.textColorSecondary5EAAA8,
                      title: "Monthly",
                      onpress: () {
                        setState(() {
                          _selectedIndexFrequency = 2;
                        });
                      },
                    ),
                  ),
                ],
              ),
          
          
              CustomText(text: "Frequency of the task", fontSize: 16.h, color: Colors.black, top: 16.h, bottom: 12.h),
              CustomButton(
                color: AppColors.textColorSecondary5EAAA8,
                  boderColor: AppColors.textColorSecondary5EAAA8,
                  height: 40.h,
                  title: "Use my current location", onpress: (){}),


              SizedBox(height: 16.h),

              CustomTextField(
                readOnly: true,
                  onTap: () async{


                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      String formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                      dateCtrl.text = formattedDate;
                    }


                  },
                  controller: dateCtrl, hintText: "Select Date", labelText: "Schedule"),


              SizedBox(height: 40.h),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50.w),
                child: CustomButton(title: "Create Task", onpress: (){}),
              ),

              SizedBox(height: 100.h),




            ],
          ),
        ),
      ),

    );
  }


  final ImagePicker _picker = ImagePicker();

  List<File> _images = [];

  int _currentIndex = 0;

  Future<void> _pickImages() async {
    final List<XFile>? picked = await _picker.pickMultiImage();
    if (picked != null) {
      final newImages = picked.map((x) => File(x.path)).toList();
      setState(() {
        final remaining = 5 - _images.length;
        _images.addAll(newImages.take(remaining));
        _currentIndex = _images.length - 1;
      });
    }
  }


  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      if (_images.isNotEmpty) {
        _currentIndex = index > 0 ? index - 1 : 0;
      } else {
        _currentIndex = 0;
      }
    });
  }



}
