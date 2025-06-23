import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants/app_colors.dart';
import '../../../widgets/cachanetwork_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/shop_task_card.dart';

class PullScreen extends StatelessWidget {
  const PullScreen({super.key});

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
            CustomText(text: "Poll", fontSize: 20.h, left: 60.w)
          ],
        ),
      ),


      body: Column(
        children: [


          SizedBox(height: 20.h),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.only(bottom: 10.h, right: 20.w, left: 20.w),
                  child: ShopTaskCard(
                    imagePath:
                    "https://img.etimg.com/thumb/width-1200,height-1200,imgsize-789754,resizemode-75,msid-73320212/small-biz/sme-sector/the-kirana-is-a-technology-shop-too.jpg",
                    taskTitle: "Grocery run to Trader Joe's",
                    taskType: "Personal Needs",
                    scheduledTime: "9:30AM Today",
                    peopleJoined: "3 Neighbors joined",
                    organizer: "Maria from Pine Street",
                    payAmount: "\$5",
                    selected: true,
                    ignoreJoinBtn: true,
                  ),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
