import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/core/config/app_route.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/cachanetwork_image.dart';

class HubHomeScreen extends StatelessWidget {
  HubHomeScreen({super.key});

  List hubFeatures = [
    {"icon": Assets.icons.scheduleIconsHome.svg(), "title": "Schedule"},
    {"icon": Assets.icons.chatIcons.svg(), "title": "Chat"},
    {"icon": Assets.icons.messageApplicationIcon.svg(), "title": "Application"},
    {"icon": Assets.icons.locationIcon.svg(), "title": "Location"},
    {"icon": Assets.icons.pollIcon.svg(), "title": "Poll"},
    {"icon": Assets.icons.memberIcon.svg(), "title": "Member"},
    {"icon": Assets.icons.inviteMemberIcon.svg(), "title": "Invite"},
    {"icon": Assets.icons.paymentCardIcon.svg(), "title": "Payment"},
    {"icon": Assets.icons.taskIcon.svg(), "title": "Task"},
  ];

  @override
  Widget build(BuildContext context) {
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
              imageUrl: "https://randomuser.me/api/portraits/men/10.jpg",
              border: Border.all(color: Colors.grey, width: 0.02),
            ),
            CustomText(text: "Hub Name", fontSize: 20.h, left: 60.w)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomText(text: "Features", top: 16.h, bottom: 16.h),
            Expanded(
              child: GridView.builder(
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
                        if(index == 0){
                          Get.toNamed(AppRoutes.scheduleScreen, parameters: {"screenType" : "hubHome"});
                        }
                        else if(index == 1){
                          Get.toNamed(AppRoutes.messageScreen);
                        }
                        else if(index == 2){
                          Get.toNamed(AppRoutes.applicationScreen);
                        }
                        else if(index == 3){}
                        else if(index == 4){
                          Get.toNamed(AppRoutes.pullScreen);
                        }
                        else if(index == 5){
                          Get.toNamed(AppRoutes.memberScreen);
                        }
                        else if(index == 6){
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
                                    title: "Send Invitation", onpress: (){}),
                                SizedBox(height: 20.h),

                                CustomButton(
                                  height: 35.h,
                                    fontSize: 14.h,
                                    color: Colors.transparent,
                                    titlecolor: Colors.red,
                                    title: "Find Neighbors Around Me", onpress: (){
                                    Get.back();
                                    Get.toNamed(AppRoutes.inviteScreen);
                                }),


                              ],
                            ),
                          );
                          });
                        }
                        else if(index == 7){
                          Get.toNamed(AppRoutes.paymentScreen);
                        }
                        else if(index == 8){
                          Get.toNamed(AppRoutes.taskScreen);
                        }
                      },
                      child: CustomHubFeatureCard(icon: hubFeatures[index]["icon"], title: hubFeatures[index]["title"].toString(), isAnimated: true));
                },
              ),
            )
          ],
        ),
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
