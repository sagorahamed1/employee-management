import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/config/app_route.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ProfileInformationScreen extends StatefulWidget {
  ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() => _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {


  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController imageCtrl = TextEditingController();


  @override
  void initState() {
    var data = Get.arguments;
    nameCtrl.text = data["name"];
    emailCtrl.text = data["email"];
    phoneCtrl.text = data["phone"];
    addressCtrl.text = data["address"];
    imageCtrl.text = data["image"];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "Profile Information", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 26.h),

            CustomNetworkImage(
              imageUrl: "${ApiConstants.imageBaseUrl}${imageCtrl.text}",
              height: 85.h,
              width: 85.w,
              boxShape: BoxShape.circle,
            ),


            SizedBox(height: 16.h),


            CustomTextField(
              readOnly: true,
              controller: nameCtrl,
              hintText: "Name",
              labelText: "Your Name",
              borderColor: Color(0xff592B00),
              hintextColor: Colors.black,
              contentPaddingVertical: 10.h,
            ),


            CustomTextField(
              readOnly: true,
              controller: emailCtrl,
              hintText: "Email",
              labelText: "E-mail",
              borderColor: Color(0xff592B00),
              hintextColor: Colors.black,
              contentPaddingVertical: 10.h,
            ),



            CustomTextField(
              readOnly: true,
              controller: phoneCtrl,
              hintText: "Phone No.",
              labelText: "Phone No.",
              borderColor: Color(0xff592B00),
              hintextColor: Colors.black,
              contentPaddingVertical: 10.h,
            ),



            CustomTextField(
              readOnly: true,
              controller: addressCtrl,
              hintText: "Address",
              labelText: "Address",
              hintextColor: Colors.black,
              borderColor: Color(0xff592B00),
              contentPaddingVertical: 10.h,
            ),



            Spacer(),


            CustomButton(title: "Edit Profile", onpress: (){
               Get.toNamed(AppRoutes.editProfileScreen, arguments: {
                 "name" : nameCtrl.text,
                 "image" : imageCtrl.text,
                 "email" : emailCtrl.text,
                 "phone" : phoneCtrl.text,
                 "address" : addressCtrl.text
               });
            }),

            SizedBox(height: 100.h)


          ],
        ),
      ),
    );
  }
}
