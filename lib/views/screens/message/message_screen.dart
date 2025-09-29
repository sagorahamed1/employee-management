

import 'dart:io';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:droke/controller/chat_controller.dart';
import 'package:droke/core/app_constants/app_constants.dart';
import 'package:droke/global/custom_assets/assets.gen.dart';
import 'package:droke/helper/prefs_helper.dart';
import 'package:droke/services/api_constants.dart';
import 'package:droke/views/widgets/custom_text_field.dart';
import 'package:droke/views/widgets/no_data_found_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_constants/app_colors.dart';
import '../../widgets/cachanetwork_image.dart';
import '../../widgets/custom_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final ChatController chatController = Get.put(ChatController());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController messageCtrl = TextEditingController();
  final TextEditingController myId = TextEditingController();

  final List<File> _photos = [];
  var data = Get.arguments;

  @override
  void initState() {
    super.initState();

    chatController.fetchChat(hubId: data["hubId"]);
    chatController.listenMessage(hubId: data["hubId"]);

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        chatController.loadMore();
      }
    });

    getMyId();
  }

  Future<void> getMyId() async {
    myId.text = await PrefsHelper.getString(AppConstants.userId);
    setState(() {});
  }

  @override
  void dispose() {
    chatController.offListenMessage(hubId: data["hubId"]);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _addPhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _photos.add(File(image.path));
      });
    }
  }

  void _handleSend() {
    if (messageCtrl.text.trim().isNotEmpty) {
      chatController.sendMessage(
        message: messageCtrl.text.trim(),
        hubId: data["hubId"],
      );
      messageCtrl.clear();
    }

    if (_photos.isNotEmpty) {
      for (var file in _photos) {
        chatController.sendFile(
          image: file,
          message: "",
          hubId: data["hubId"],
        );
      }
      _photos.clear();
      setState(() {});
    }
  }

  Widget _buildMessageInput() {
    return Column(
      children: [
        if (_photos.isNotEmpty)
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _photos.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.w),
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                          image: FileImage(_photos[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _photos.removeAt(index));
                        },
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: Colors.black54,
                          child: Icon(Icons.close,
                              color: Colors.white, size: 16.sp),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.photo, color: Colors.grey),
                onPressed: () => _addPhoto(ImageSource.gallery),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.grey),
                onPressed: () => _addPhoto(ImageSource.camera),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: TextField(
                    controller: messageCtrl,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: AppColors.primaryColor),
                onPressed: _handleSend,
              ),
            ],
          ),
        ),
      ],
    );
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
            CustomText(text: "Hub Names", fontSize: 20.h, left: 60.w),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => chatController.chatLoading.value
                  ? const SizedBox()
                  : chatController.chats.isEmpty
                  ? const NoDataFoundCard()
                  : ListView.builder(
                    reverse: true,
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: 10.h),
                itemCount: chatController.chats.length,
                itemBuilder: (context, index) {
                  final message = chatController.chats[index];


                 
                  return
                    message.messageType == "image" ?
                        BubbleNormalImage(
                            id: "1",
                            image: CustomNetworkImage(imageUrl: "${ApiConstants.imageBaseUrl}${message.file}")
                        )
                        :
                    BubbleSpecialOne(
                    text: message.message.toString(),
                    isSender: message.senderId == myId.text,
                    seen: true,
                    color: message.senderId == myId.text
                        ? const Color(0xffEADDC6)
                        : const Color(0xFFE8E8EE),
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
          _buildMessageInput(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}




