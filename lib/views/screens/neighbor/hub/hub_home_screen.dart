import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/helper/toast_message_helper.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../widgets/cachanetwork_image.dart';



class HubHomeScreen extends StatefulWidget {
  HubHomeScreen({super.key});

  @override
  State<HubHomeScreen> createState() => _HubHomeScreenState();
}

class _HubHomeScreenState extends State<HubHomeScreen> {

  NeighborController neighborController = Get.find<NeighborController>();

  List hubFeatures = [
    // {"icon": Assets.icons.scheduleSelected.svg(height: 40.h), "title": "Schedule"},
    {"icon": Assets.icons.chatIcons.svg(), "title": "Chat"},
   if(Get.arguments["role"] != "freelancer") {"icon": Assets.icons.messageApplicationIcon.svg(), "title": "Application"},
    // {"icon": Assets.icons.locationIcon.svg(), "title": "Location"},
    if(Get.arguments["role"] != "freelancer") {"icon": Assets.icons.pollIcon.svg(), "title": "Poll"},
    {"icon": Assets.icons.memberIcon.svg(), "title": "Member"},
    if(Get.arguments["role"] != "freelancer") {"icon": Assets.icons.inviteMemberIcon.svg(), "title": "Invite"},
    {"icon": Assets.icons.paymentCardIcon.svg(), "title": "Payment"},
    // if(Get.arguments["role"] != "freelancer") {"icon": Assets.icons.taskIcon.svg(), "title": "Task"},
  ];


  @override
  void initState() {
    var data = Get.arguments;
    neighborController.getDeshBoard(hubId: "${data["hubId"]}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 5,
        shadowColor: Colors.black,
        title: Row(
          children: [
            CustomNetworkImage(
              height: 36.h,
              width: 36.w,
              boxShape: BoxShape.circle,
              imageUrl: "${data["image"]}",
              border: Border.all(color: Colors.grey, width: 0.02),
            ),
            CustomText(text: "${data["name"]}", fontSize: 20.h, left: 60.w)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomText(text: "Features", top: 16.h, bottom: 16.h),
            GridView.builder(
              shrinkWrap: true,
              itemCount: hubFeatures.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.811,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      if(hubFeatures[index]["title"] == "Schedule"){
                        Get.toNamed(AppRoutes.scheduleScreen, parameters: {"screenType" : "hubHome"});
                      }
                      else if(hubFeatures[index]["title"] == "Chat"){
                        Get.toNamed(AppRoutes.messageScreen,arguments:  {
                          "hubId" : data["hubId"],
                          "name" : data["name"],
                          "image" : data["image"]
                        });
                      }
                      else if(hubFeatures[index]["title"] == "Application"){
                        Get.toNamed(AppRoutes.applicationScreen, arguments: {
                          "hubId" : data["hubId"]
                        });
                      }
                      else if(hubFeatures[index]["title"] == "Location"){

                      }
                      else if(hubFeatures[index]["title"] == "Poll"){
                        Get.toNamed(AppRoutes.pullScreen, arguments: {
                          "hubId" : data["hubId"]
                        });
                      }
                      else if(hubFeatures[index]["title"] == "Member"){
                        Get.toNamed(AppRoutes.memberScreen, arguments: {
                          "hubId" : data["hubId"]
                        });
                      }
                      else if(hubFeatures[index]["title"] == "Invite"){
                        TextEditingController emailCtrl = TextEditingController();
                        showDialog(context: context, builder: (context) {
                        return  AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              SizedBox(height: 24.h),
                              Assets.images.inviteTopImage.image(height: 100.h, width: 149.w),


                              CustomText(text: "Invite neighbor to the Hub", fontSize: 16.h, bottom: 16.h, top: 8.h),


                              CustomTextField(
                                  contentPaddingVertical: 10.h,
                                  controller: emailCtrl, hintText: "Email Address"),

                              SizedBox(height: 10.h),


                              CustomButton(
                                  height: 35.h,
                                  fontSize: 14.h,
                                  title: "Send Invitation", onpress: (){

                                    if(emailCtrl.text.isEmpty){
                                      ToastMessageHelper.showToastMessage("Enter an email address", title: "Warning");
                                    }else{
                                      neighborController.invite(receiverEmail: emailCtrl.text, hubId: data["hubId"]);
                                    }

                              }),
                              SizedBox(height: 20.h),

                              CustomButton(
                                height: 35.h,
                                  fontSize: 14.h,
                                  color: Colors.transparent,
                                  titlecolor: Colors.red,
                                  title: "Find Neighbors Around Me", onpress: (){
                                  Get.back();
                                  Get.toNamed(AppRoutes.inviteScreen, arguments: {
                                    "hubId" : data["hubId"]
                                  });
                              }),


                            ],
                          ),
                        );
                        });
                      }
                      else if(hubFeatures[index]["title"] == "Payment"){
                        Get.toNamed(AppRoutes.paymentScreen);
                      }
                      else if(hubFeatures[index]["title"] == "Task"){
                        Get.toNamed(AppRoutes.taskScreen);
                      }
                    },
                    child: CustomHubFeatureCard(icon: hubFeatures[index]["icon"], title: hubFeatures[index]["title"].toString(), isAnimated: true));
              },
            ),



            Obx(() {
              var hubData = neighborController.dashBoard.value;
              return  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF4F1EE),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CustomNetworkImage(
                            height: 107.5.h,
                            width: 93.w,
                            imageUrl: "${ApiConstants.imageBaseUrl}${hubData.freelancerData?.image}",
                            border: Border.all(color: Colors.grey, width: 0.02),
                          )),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow("Freelancer name", '${hubData.freelancerData?.name}' ?? ""),
                              _buildRow("Address", '${hubData.freelancerData?.name}' ?? ""),
                              _buildRow("Schedule", hubData.freelancerData?.schedule ?? "N/A"),
                              _buildRow("Rent", hubData.freelancerData?.rent ?? "N/A")

                            ],
                          ),
                        ),
                      ),



                      GestureDetector(

                          onTap: () {
                            Get.toNamed(AppRoutes.hubMapScreen, arguments: {
                              "hubId" : data["hubId"]
                            });
                          },
                          child: Assets.icons.locationIconSvg_.svg()),
                    ],
                  ),
                ),
              );
            }),


            SizedBox(height: 24.h),


            Obx(() {
             var hubData = neighborController.dashBoard.value;
             return  Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
                 border: Border.all(color: AppColors.primaryColor),
                 color: Color(0xffF4F1EE),
               ),
               child: Padding(
                 padding: EdgeInsets.all(10.r),
                 child: Row(
                   children: [
                     ClipRRect(
                         borderRadius: BorderRadius.circular(12.r),
                         child: CustomNetworkImage(
                           height: 107.5.h,
                           width: 93.w,
                           imageUrl: "${ApiConstants.imageBaseUrl}${hubData.freelancerData?.image}",
                           border: Border.all(color: Colors.grey, width: 0.02),
                         )),
                     SizedBox(width: 10.w),
                     Expanded(
                       child: Padding(
                         padding: EdgeInsets.symmetric(vertical: 1.h),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             _buildRow("Service Title", '${hubData.hubData?.title}' ?? ""),
                             _buildRow("Service Category", '${hubData.hubData?.category}' ?? ""),
                             _buildRow("Location", hubData.hubData?.location ?? "N/A"),
                             _buildRow("Task Frequency", "nai" ?? ""),
                             _buildRow("Status", hubData.freelancerData?.name ?? "N/A")

                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             );
           })


          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.w,
            child: CustomText(
              textAlign: TextAlign.start,
              text: label.toString(),
              fontWeight: FontWeight.w600,
              fontSize: 10.h,
            ),
          ),
          Expanded(
            child: CustomText(
              text: ":  $value",
              textAlign: TextAlign.start,
              fontSize: 10.h,
            ),
          ),
        ],
      ),
    );
  }
}


class CustomHubFeatureCard extends StatefulWidget {
  final Widget icon;
  final String title;
  final bool? isAnimated;

  const CustomHubFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    this.isAnimated,
  });

  @override
  State<CustomHubFeatureCard> createState() => _CustomHubFeatureCardState();
}

class _CustomHubFeatureCardState extends State<CustomHubFeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: -8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // Up and down movement
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: widget.icon,
          ),
          const SizedBox(height: 10),
          CustomText(
            text: widget.title,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
