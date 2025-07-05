import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_text.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController messageCtrl = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void sendMessage() {
    if (messageCtrl.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'text': messageCtrl.text.trim(),
        'isSender': true, // change to false if simulating receiver message
      });
      messageCtrl.clear();
    });
  }

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
            CustomText(text: "Hub Names", fontSize: 20.h, left: 60.w)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return BubbleSpecialOne(
                  text: message['text'],
                  isSender: message['isSender'],
                  seen: true,
                  color: message['isSender']
                      ? Color(0xffEADDC6)
                      : const Color(0xFFE8E8EE),
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: message['isSender'] ? Colors.black : Colors.black
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Padding(
                  padding:  EdgeInsets.only(top: 15.h),
                  child: Assets.icons.groupIcon.svg(),
                )),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 15,
                  child: CustomTextField(
                    borderColor: Colors.transparent,
                    controller: messageCtrl,
                    hintText: "Type...",
                    validator: (value) {},
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: sendMessage,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10.h),
                    child: Assets.icons.messagesRight.svg(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
