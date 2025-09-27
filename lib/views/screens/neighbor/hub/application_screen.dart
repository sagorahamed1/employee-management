import 'package:droke/core/config/app_route.dart';
import 'package:droke/services/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../widgets/custom_shimmer.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/no_data_found_card.dart';
import '../../../widgets/shop_task_card.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {


  NeighborController neighborController = Get.find<NeighborController>();
  final ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    neighborController.application.value  = [];
    var data = Get.arguments;
    neighborController.getApplication(hubId: data["hubId"]);
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        neighborController.loadMore(screenType: "application");
        print("load more true");
      }
    });
  }

  @override
  void dispose() {
    neighborController.page.value = 1;
    neighborController.application.value  = [];
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(text: "Freelancer Application", fontSize: 20.h, left: 60.w),
      ),


      body: Column(
        children: [


          SizedBox(height: 10.h),

          Expanded(
            child: Obx(() =>

            neighborController.applicationLoading.value ? CustomShimmer() : neighborController.application.isEmpty ? NoDataFoundCard() :


            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: neighborController.application.length +1,
                itemBuilder: (context, index) {

                  if(index < neighborController.application.length){
                    var application = neighborController.application[index];
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                      child: ShopTaskCard(
                        onTap: (){
                          Get.toNamed(AppRoutes.freelancerProfileScreen, arguments: {

                            "image": "${ApiConstants.imageBaseUrl}${application.image}",
                            "taskTitle": "${application.serviceTittle}",
                            "taskType": "${application.category}",
                            "scheduledTime": "${application.timeSlot}",
                            "freelancer": "${application.freelancer}",
                            "price": "\$${application.fee}",
                            "description" : "${application.description}",
                            "location" : "${application.location}"

                          });
                        },
                        imagePath: "${ApiConstants.imageBaseUrl}${application.image}",
                        taskTitle: "${application.serviceTittle}",
                        taskType: "${application.category}",
                        scheduledTime: "${application.timeSlot}",
                        peopleJoined: "",
                        organizer: "",
                        payAmount: "\$${application.fee}",
                        btnName: "View Profile",
                      ),
                    );

                  }else if(index >= neighborController.totalResult){
                    return null;
                  }else{
                    return CircularProgressIndicator();
                  }

                },
              ),
            ),
          ),


        ],
      ),
    );
  }
}
