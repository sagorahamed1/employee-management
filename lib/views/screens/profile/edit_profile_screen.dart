import 'dart:io';
import 'dart:typed_data';

import 'package:droke/controller/profile_controller.dart';
import 'package:droke/services/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  ProfileController profileController = Get.put(ProfileController());

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController imageCtrl = TextEditingController();

  @override
  void initState() {
    var data = Get.arguments;
    nameCtrl.text = data["name"];
    phoneCtrl.text = data["phone"];
    addressCtrl.text = data["address"];
    imageCtrl.text = data["image"];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "Edit Profile", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.h),
          
              GestureDetector(
                onTap: (){
                  showImagePickerOption(context);
                },
                child: SizedBox(
                  height: 86.h,
                  child: Stack(
                    children: [
          
          
                      _image != null ?
                      CircleAvatar(
                          radius: 85.r,
                          backgroundImage: MemoryImage(_image!)) :
                      CustomNetworkImage(
                        imageUrl: "${ApiConstants.imageBaseUrl}${imageCtrl.text}",
                        height: 85.h,
                        width: 85.w,
                        boxShape: BoxShape.circle,
                      ),
          
          
                      Positioned(
                        bottom: 7.h,
                          left: 30.w,
                          child: Icon(Icons.camera_alt_outlined, color: Colors.white)
          
                      )
                    ],
                  ),
                ),
              ),
          
          
              SizedBox(height: 16.h),
          
          
              CustomTextField(
                controller: nameCtrl,
                hintText: "Enter Name",
                labelText: "Your Name",
                contentPaddingVertical: 10.h,
                borderColor: Color(0xff592B00),
                hintextColor: Colors.black,
              ),
          
          
          
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: phoneCtrl,
                hintText: "Enter Phone No.",
                labelText: "Phone No.",
                borderColor: Color(0xff592B00),
                hintextColor: Colors.black,
                contentPaddingVertical: 10.h,
              ),
          
          
          
              CustomTextField(
                controller: addressCtrl,
                hintText: "Enter Address",
                labelText: "Address",
                borderColor: Color(0xff592B00),
                hintextColor: Colors.black,
                contentPaddingVertical: 10.h,
              ),
          
          
          
                 SizedBox(height: 200.h),
          
          
              CustomButton(title: "Update Profile", onpress: (){
          
                profileController.updateUserProfile(
                  address: addressCtrl.text,
                  phone: phoneCtrl.text,
                  name: nameCtrl.text,
                  profileImage: selectedIMage
                );
          
          
              }),
          
              SizedBox(height: 100.h)
          
          
            ],
          ),
        ),
      ),
    );
  }





  //==================================> ShowImagePickerOption Function <===============================

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                            ),
                            CustomText(text: 'Gallery')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 50.w,
                            ),
                            CustomText(text: 'Camera')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  Uint8List? _image;
  File? selectedIMage;

  //==================================> Gallery <===============================
  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    selectedIMage = File(returnImage.path);
    _image = File(returnImage.path).readAsBytesSync();
    setState(() {
    });
    Get.back();
  }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    Get.back();
    selectedIMage = File(returnImage.path);
    _image = File(returnImage.path).readAsBytesSync();
    setState(() {});

  }
}
