import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../models/chat_model.dart';
import '../services/api_client.dart';
import '../services/api_constants.dart';
import '../services/socket_services.dart';

class ChatController extends GetxController {
  RxInt page = 1.obs;
  var totalPage = (-1);
  var totalResult = (-1);

  void loadMore() {
    if (totalPage > page.value) {
      page.value += 1;
      fetchChat();
      update();
    }
  }

  RxList<ChatModel> chats = <ChatModel>[].obs;
  RxBool chatLoading = false.obs;

  RxString dummyHubId = "".obs;

  fetchChat({String? hubId}) async {
    if (page.value == 1) {
      clearChats();
      dummyHubId.value = hubId ?? "";
      chatLoading(true);
      update();
    }

    var response = await ApiClient.getData(
        "${ApiConstants.message}/$dummyHubId?page=${page.value}&limit=18");

    if (response.statusCode == 200) {
      totalPage =
          jsonDecode(response.body['pagination']['totalPage'].toString());
      totalResult =
          jsonDecode(response.body['pagination']['totalItem'].toString()) ?? 0;

      var data = List<ChatModel>.from(
          response.body["data"].map((x) => ChatModel.fromJson(x)));
      chats.addAll(data);
      chats.refresh();
      update();
      chatLoading(false);
    }
    chatLoading(false);
  }

  clearChats() {
    chats.clear();
    page.value = 1;
    totalPage = -1;
    totalResult = -1;
    dummyHubId.value = "";
    update();
  }



  ///=======================Socket ====================>>>>

  SocketServices socketServices = SocketServices();

  void listenMessage({String? hubId}) async {
    socketServices.socket.on("getMessage-${hubId ?? ""}", (data) {
      if (data != null) {
        ChatModel demoData = ChatModel.fromJson(data);

        chats.insert(0, demoData);
        update();

        print('Message added to chatMessages list');
      } else {
        print("No message data found in the response");
      }
    });
  }

  void offListenMessage({String? hubId}) {
    socketServices.socket.off("getMessage-${hubId ?? ""}");
  }

  sendFile({String? message, hubId, File? image}) async {

    var body = {"message": "${message}"};
    List<MultipartBody> files = [MultipartBody("image", image!)];

    ApiClient.postMultipartData("${ApiConstants.sendMessage}/${hubId}",
        body, multipartBody: files);
  }

  sendMessage({String? message, hubId, File? image}) async {
    var body = {"message": message};
    ApiClient.postData(
        "${ApiConstants.sendMessage}/${hubId}", jsonEncode(body));
  }
}
