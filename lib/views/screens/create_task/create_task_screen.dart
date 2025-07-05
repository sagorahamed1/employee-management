import 'dart:io';

import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/custom_assets/assets.gen.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
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
        child: Column(
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

          ],
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
