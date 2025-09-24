import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../controller/privacy_policy_controller.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../widgets/custom_text.dart';


class PrivacyPolicyAllScreen extends StatefulWidget {
  const PrivacyPolicyAllScreen({super.key});

  @override
  State<PrivacyPolicyAllScreen> createState() => _PrivacyPolicyAllScreenState();
}

class _PrivacyPolicyAllScreenState extends State<PrivacyPolicyAllScreen> {

  PrivacyPolicyController policyController = Get.put(PrivacyPolicyController());

  @override
  void initState() {
    policyController.getPrivacyPolicyAll(
        url: Get.arguments["title"] == "Terms of service"
            ? "/terms" :  Get.arguments["title"] == "Privacy Policy"
            ? "/privacy" : "/about");
    super.initState();
  }


  @override
  void dispose() {
    policyController.valueText.value = "";
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: CustomText(text: "${Get.arguments["title"]}", fontSize: 22.h, color: AppColors.textColorSecondary5EAAA8)),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Obx(
                ()=>
            policyController.valueText.isEmpty ? Center(child: CircularProgressIndicator()) :
            Column(
              children: [

                SizedBox(height: 20.h),


                // CustomText(
                //   color: Colors.black,
                //   maxline: 1000,
                //   textAlign: TextAlign.start,
                //   text: "${policyController.valueText.value}",)
                //


                HtmlWidget(
                    "${policyController.valueText.value}",
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14.h,

                    )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
