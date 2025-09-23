import 'package:droke/core/app_constants/app_colors.dart';
import 'package:droke/helper/time_format_helper.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_shimmer.dart';
import 'package:droke/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/notifications_controller.dart';
import '../../widgets/cachanetwork_image.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationsController notificationsController =
      Get.put(NotificationsController());

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    notificationsController.getGetNotifications();
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        notificationsController.loadMore();
        print("load more true");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
            text: "Notifications",
            color: AppColors.textColorSecondary5EAAA8,
            fontSize: 22.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => notificationsController.notificationLoading.value
                    ? CustomShimmer()
                    : notificationsController.notifications.isEmpty
                        ? CustomText(
                            text: "No Data Found!",
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: notificationsController.notifications.length + 1,
                            itemBuilder: (context, index) {
                              if (index < notificationsController.notifications.length) {
                                var notification = notificationsController.notifications[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: Color(0xffF4F1EE)),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              child: CustomNetworkImage(
                                                height: 60.h,
                                                width: 60.w,
                                                boxShape: BoxShape.circle,
                                                imageUrl:
                                                    "${ApiConstants.imageBaseUrl}${notification.id}",
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.02),
                                              )),
                                          SizedBox(width: 12.w),
                                          CustomText(
                                              text:
                                                  "${notification.msg}",
                                              fontSize: 12.h),
                                          Spacer(),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 45.h),
                                                child: CustomText(
                                                    text: "${TimeFormatHelper.formatDate(notification.createdAt ?? DateTime.now())}",
                                                    fontSize: 9.h),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (index >= notificationsController.totalResult) {
                                return null;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
