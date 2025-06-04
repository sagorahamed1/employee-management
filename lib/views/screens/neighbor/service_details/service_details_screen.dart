import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Available Hubs",
          fontSize: 22.h,
          color: AppColors.textColorSecondary5EAAA8,
        ),
      ),
      body: Column(
        children: [


        ],
      ),
    );
  }
}
