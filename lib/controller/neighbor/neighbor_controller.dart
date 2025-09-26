import 'dart:convert';
import 'dart:io';

import 'package:droke/core/config/app_route.dart';
import 'package:droke/helper/toast_message_helper.dart';
import 'package:droke/models/member_model.dart';
import 'package:droke/models/my_hub_model.dart';
import 'package:droke/models/poll_model.dart';
import 'package:droke/models/service_details_model.dart';
import 'package:droke/models/service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/application_model.dart';
import '../../models/deshboard_model.dart';
import '../../models/hub_model.dart';
import '../../models/invited_request_model.dart';
import '../../models/join_request_model.dart';
import '../../models/near_by_neighbor_model.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../../views/screens/neighbor/neighbor_bottom_nav_bar/neighbor_bottom_nav_bar.dart';

class NeighborController extends GetxController {
  RxBool serviceLoading = false.obs;
  RxList<ServiceModel> services = <ServiceModel>[].obs;

  getService() async {
    serviceLoading(true);

    var response = await ApiClient.getData('${ApiConstants.services}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      services.value = List<ServiceModel>.from(
          response.body["data"].map((x) => ServiceModel.fromJson(x)));

      update();
      serviceLoading(false);
    } else {
      serviceLoading(false);
    }
  }


  RxBool serviceDetailsLoading = false.obs;
  Rx<ServiceDetailsModel> serviceDetails = ServiceDetailsModel().obs;

  getServiceDetails({required String serviceId}) async {
    serviceDetailsLoading(true);
    var response = await ApiClient.getData('${ApiConstants.servicesDetails}/${serviceId}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      serviceDetails.value = ServiceDetailsModel.fromJson(response.body["data"]);
      update();
      serviceDetailsLoading(false);
    } else {
      serviceDetailsLoading(false);
    }
  }




  RxBool dashBoardLoading = false.obs;
  Rx<DeshBoardModel> dashBoard = DeshBoardModel().obs;

  getDeshBoard({required String hubId}) async {
    dashBoardLoading(true);
    var response = await ApiClient.getData('${ApiConstants.deshBoard}/${hubId}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      dashBoard.value = DeshBoardModel.fromJson(response.body["data"]);
      update();
      dashBoardLoading(false);
    } else {
      dashBoardLoading(false);
    }
  }





  ///===============Hub Create================<>
  RxBool hubCreateLoading = false.obs;

  hubCreate({var body, required String serviceId, File? image,required BuildContext context}) async {
    hubCreateLoading(true);

    List<MultipartBody> files = [MultipartBody("hubImage", image!)];

    var response = await ApiClient.postMultipartData(
        "${ApiConstants.hubAdd}/$serviceId", body,
        multipartBody: files);

    print("==================${response.body} \n response : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NeighborBottomNavBar(selectedIndex: 1),
        ),
      );

      ToastMessageHelper.showToastMessage(response.body["message"]);
      hubCreateLoading(false);
    } else {
      hubCreateLoading(false);
    }
  }



  ///===============Hub Create================<>


  joinRequest({required String serviceId}) async {
    var response = await ApiClient.patch(
        "${ApiConstants.joinHub}/${serviceId??""}", jsonEncode({}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final hub = hubs.firstWhere((x) => x.id == serviceId);
      hub.isJoined = true;
      update();
    }
  }


  inviteAccept({required String id, status}) async {

    var body = {
      "status" : status,
      "requestId" : id.toString()
    };

    var response = await ApiClient.patch(
        "${ApiConstants.invite}", jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      ToastMessageHelper.showToastMessage(response.body["message"]);
      Get.back();

    }else{
      ToastMessageHelper.showToastMessage(response.body["message"],title:  "error");
    }
  }


  ///===============Hub Create================<>


  invite({required String receiverEmail, hubId}) async {

    var body = {
      "receiver" : "$receiverEmail",
      "hub" : "$hubId"
    };

    var response = await ApiClient.postData(
        "${ApiConstants.invite}", jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {

      ToastMessageHelper.showToastMessage(response.body["message"]);

    }else{
      ToastMessageHelper.showToastMessage(response.body["message"], title: "info");
    }
  }




  pollStart({required String hubId}) async {

    var response = await ApiClient.postData("${ApiConstants.startHub}/$hubId", jsonEncode({}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      ToastMessageHelper.showToastMessage(response.body["message"]);
      getPoll(hubId: hubId);
    }else{
      ToastMessageHelper.showToastMessage(response.body["message"], title: "info");
    }
  }



  acceptJoinRequest({required String hubId, status}) async {

    var response = await ApiClient.patch("${ApiConstants.inviteAcceptOrReject}/$hubId?status=$status", jsonEncode({}));
    if (response.statusCode == 200 || response.statusCode == 201) {

      ToastMessageHelper.showToastMessage(response.body["message"]);
      getPoll(hubId: hubId);
    }else{
      ToastMessageHelper.showToastMessage(response.body["message"], title: "info");
    }
  }




  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);


    void loadMore({String? screenType}) {
    print("==========================================total page ${totalPage} page No: ${page.value} == total result ${totalResult}");
    if (totalPage > page.value) {
      page.value += 1;

      if(screenType == "hubHome"){
        getHubs();
      }else if(screenType == "myHub"){
        getMyHubs();
      }else if(screenType == "application"){
        getApplication();
      }else if(screenType == "pull"){
        getPoll();
      }

      print("**********************print here");
      update();
    }
    print("**********************print here**************");
  }



  RxBool getHubsLoading = false.obs;
  RxList<HubModel> hubs = <HubModel>[].obs;

  getHubs({String? search}) async {
    if (page.value == 1) {
      hubs.value = [];
      getHubsLoading(true);
    }
    var response = await ApiClient.getData(
        '${ApiConstants.hub}&page=${page.value ?? ""}&searchQ=${search??""}');
    if (response.statusCode == 200) {
      totalPage = jsonDecode(response.body['pagination']['totalPages'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalCount'].toString()) ?? 0;
      var data = List<HubModel>.from(response.body["data"].map((x) => HubModel.fromJson(x)));
      hubs.addAll(data);
      update();
      getHubsLoading(false);
    } else {
      getHubsLoading(false);
    }
  }





  RxBool myHubLoading = false.obs;
  RxList<MyHubModel> myHubs = <MyHubModel>[].obs;
  RxString invitedCount = ''.obs;

  getMyHubs({String? search}) async {
    if (page.value == 1) {
      myHubs.value = [];
      myHubLoading(true);
    }
    var response = await ApiClient.getData(
        '${ApiConstants.myHubs}?page=${page.value ?? ""}&searchQ=${search??""}&limit=10');
    if (response.statusCode == 200) {
      totalPage = jsonDecode(response.body['pagination']['totalPage'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalData'].toString()) ?? 0;
      var data = List<MyHubModel>.from(response.body["data"]["hubs"].map((x) => MyHubModel.fromJson(x)));

      myHubs.addAll(data);
      invitedCount.value = response.body["data"]["joinRequest"].toString();
      update();

      myHubLoading(false);
    } else {
      myHubLoading(false);
    }
  }



  RxBool getNearLoading = false.obs;
  RxList<NearByNeighborModel> nearNeighbors = <NearByNeighborModel>[].obs;

  getNearNeighbors({String? search}) async {
    getNearLoading(true);

    var response = await ApiClient.getData(
        '${ApiConstants.nearNeighbors}?page=1&searchQ=${search??""}&limit=1000&longitude=90.413&latitude=23.456');
    if (response.statusCode == 200) {

      nearNeighbors.value  = List<NearByNeighborModel>.from(response.body["data"].map((x) => NearByNeighborModel.fromJson(x)));

      getNearLoading(false);
    } else {
      getNearLoading(false);
    }
  }




  RxBool memberLoading = false.obs;
  RxList<MemberModel> members = <MemberModel>[].obs;

  getMember({String? hubId}) async {
    memberLoading(true);

    var response = await ApiClient.getData(
        '${ApiConstants.member}/${hubId??""}?page=1&limit=1000');
    if (response.statusCode == 200) {

      members.value  = List<MemberModel>.from(response.body["data"].map((x) => MemberModel.fromJson(x)));

      memberLoading(false);
    } else {
      memberLoading(false);
    }
  }




  RxBool applicationLoading = false.obs;
  RxList<ApplicationModel> application = <ApplicationModel>[].obs;
  RxString dummyHubId = ''.obs;

  getApplication({String? hubId}) async {

    if (page.value == 1) {
      dummyHubId.value = hubId.toString();
      application.value = [];
      applicationLoading(true);
    }


    var response = await ApiClient.getData(
        '${ApiConstants.application}/${dummyHubId??""}?page=1&limit=10');
    if (response.statusCode == 200) {


      totalPage = jsonDecode(response.body['pagination']['totalPages'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalCount'].toString()) ?? 0;
      var data  = List<ApplicationModel>.from(response.body["data"].map((x) => ApplicationModel.fromJson(x)));
      application.addAll(data);
      update();
      applicationLoading(false);
    } else {
      applicationLoading(false);
    }
  }





  RxBool pollLoading = false.obs;
  RxBool isHubOwner = false.obs;
  RxList<PollModel> pulls = <PollModel>[].obs;
  RxString pollMessage = ''.obs;


  getPoll({String? hubId}) async {

    if (page.value == 1) {
      pollMessage.value = "";
      dummyHubId.value = hubId.toString();
      application.value = [];
      pollLoading(true);
    }


    var response = await ApiClient.getData(
        '${ApiConstants.poll}/${dummyHubId??""}?page=1&limit=10');
    if (response.statusCode == 200) {


      totalPage = jsonDecode(response.body['pagination']['totalPages'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalCount'].toString()) ?? 0;
      var data  = List<PollModel>.from(response.body["data"].map((x) => PollModel.fromJson(x)));
      pulls.addAll(data);
      update();
      pollLoading(false);
    }else if(response.statusCode == 202){

      pollMessage.value = response.body["data"]["message"];
      isHubOwner(response.body["data"]["isHubOwner"]);
      update();
      pollLoading(false);

    } else {
      pollLoading(false);
    }
  }





  RxBool joinRequestLoading = false.obs;
  RxList<JoinRequestModel> geJoinRequest = <JoinRequestModel>[].obs;

  getJoinRequest({String? hubId}) async {
    joinRequestLoading(true);

    var response = await ApiClient.getData(
        '${ApiConstants.getJoin}/${hubId??""}?page=1&limit=1000');
    if (response.statusCode == 200) {

      geJoinRequest.value  = List<JoinRequestModel>.from(response.body["data"].map((x) => JoinRequestModel.fromJson(x)));

      joinRequestLoading(false);
    } else {
      joinRequestLoading(false);
    }
  }





  RxBool inviteRequestLoading = false.obs;
  RxList<InvitedRequestModel> invitedRequest = <InvitedRequestModel>[].obs;

  getInviteRequest() async {
    inviteRequestLoading(true);

    var response = await ApiClient.getData(
        '${ApiConstants.invitedRequest}?page=1&limit=1000');
    if (response.statusCode == 200) {

      invitedRequest.value  = List<InvitedRequestModel>.from(response.body["data"].map((x) => InvitedRequestModel.fromJson(x)));

      inviteRequestLoading(false);
    } else {
      inviteRequestLoading(false);
    }
  }






}
