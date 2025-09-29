import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_button.dart';
import 'package:droke/views/widgets/custom_shimmer.dart';
import 'package:droke/views/widgets/no_data_found_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/shop_task_card.dart';

class PullScreen extends StatefulWidget {
  const PullScreen({super.key});

  @override
  State<PullScreen> createState() => _PullScreenState();
}

class _PullScreenState extends State<PullScreen> {


  NeighborController neighborController = Get.find<NeighborController>();
  final ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    var data = Get.arguments;
    neighborController.getPoll(hubId: data["hubId"]);
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        neighborController.loadMore(screenType: "pull");
        print("load more true");
      }
    });
  }

  @override
  void dispose() {
    neighborController.page.value = 1;
    neighborController.pulls.value = [];
    _scrollController.dispose();
    super.dispose();
  }

  String selectedIndex = "";




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
              imageUrl: "https://randomuser.me/api/portraits/men/10.jpg",
              border: Border.all(color: Colors.grey, width: 0.02),
            ),
            CustomText(text: "Poll", fontSize: 20.h, left: 60.w)
          ],
        ),
      ),


      body: Column(
        children: [


          SizedBox(height: 20.h),

          Expanded(
            child: Obx(() => neighborController.pollLoading.value ? CustomShimmer() :
            neighborController.pollMessage.value != "" ? Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomText(text: "${neighborController.pollMessage.value}", fontSize: 17.h, maxline: 2),

                  SizedBox(height: 200),


                  neighborController.isHubOwner.value ?
                  CustomButton(title: "Start Poll", onpress: (){

                    neighborController.pollStart(hubId: data["hubId"]);

                  }) : SizedBox()


                ],
              ),
            ) :
            neighborController.pulls.isEmpty ? NoDataFoundCard() :
               ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: neighborController.pulls.length +1,
                itemBuilder: (context, index) {
                  if(index < neighborController.pulls.length){

                    var pull = neighborController.pulls[index];

                    return Padding(
                      padding:  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: selectedIndex == pull.freelancerId.toString() ? Colors.green : Colors.transparent),
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: ShopTaskCard(
                          imagePath:
                          "${ApiConstants.imageBaseUrl}${pull.image}",
                          taskTitle: "${pull.serviceTitle}",
                          hubName: "",
                          taskType: "${pull.taskType}",
                          scheduledTime: "${pull.timeSlot}",
                          peopleJoined: "",
                          organizer: "",
                          payAmount: "\$${pull.fee}",
                          selected: pull.isVoted ?? false,
                          BtnOnTap: () {
                            neighborController.voteAdd(hubId: data["hubId"], freelancerId: pull.freelancerId);
                          },
                          ignoreJoinBtn: true,
                          onTap: (){


                            setState(() {
                              selectedIndex = pull.freelancerId.toString();
                            });
                          },
                        ),
                      ),
                    );
                  }else if(index >= neighborController.totalResult){
                    return null;
                  }else{
                    return  null;//Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),




          Obx((){
              if(neighborController.isOwner.value) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                      title: "Assign", onpress: (){
                    
                    neighborController.assignPull(id: selectedIndex.toString(), hubId: data["hubId"]);
                    
                  }),
                );
              }
              return SizedBox();

          }),

          Obx((){
            if(neighborController.isOwner.value) {
              return SizedBox(height: 120.h);
            }
            return SizedBox();

          }),



        ],
      ),
    );
  }
}
