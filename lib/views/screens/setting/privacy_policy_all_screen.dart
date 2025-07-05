import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../widgets/custom_text.dart';


class PrivacyPolicyAllScreen extends StatelessWidget {
  const PrivacyPolicyAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "${Get.arguments["title"]}", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8)),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 20.h),


              CustomText(
                color: Colors.black,
                maxline: 1000,
                textAlign: TextAlign.start,
                text: "Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non. \n\n Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non. \n\nLorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non. \n\nLorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non.",)


            ],
          ),
        ),
      ),
    );
  }
}
