



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
import '../../models/freelancer_hub_model.dart';
import '../../models/gig_model.dart';
import '../../models/hub_model.dart';
import '../../models/invited_request_model.dart';
import '../../models/join_request_model.dart';
import '../../models/near_by_neighbor_model.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../../views/screens/neighbor/neighbor_bottom_nav_bar/neighbor_bottom_nav_bar.dart';

class FreelancerController extends GetxController {



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




  apply({required String serviceId}) async {
    var response = await ApiClient.postData(
        "${ApiConstants.freelancerApply}/${serviceId}", jsonEncode({}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final hub = hubs.firstWhere((x) => x.id == serviceId);
      hub.isApplyed = true;
      update();
      ToastMessageHelper.showToastMessage(response.body["message"]);
    }else{
      ToastMessageHelper.showToastMessage(response.body["message"], title: "Error");
    }
  }



  ///===============Gig Create================<>
  RxBool gigCreateLoading = false.obs;

  gigCreate({var body}) async {
    gigCreateLoading(true);


    var response = await ApiClient.postData(
        "${ApiConstants.gigAdd}", jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {

      ToastMessageHelper.showToastMessage(response.body["message"]);
      gigCreateLoading(false);
    } else {
      gigCreateLoading(false);
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












  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);


  void loadMore({String? screenType}) {
    print("==========================================total page ${totalPage} page No: ${page.value} == total result ${totalResult}");
    if (totalPage > page.value) {
      page.value += 1;

      if(screenType == "hubs"){
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


  /// =================GET HUBS===============>>>


  RxBool getHubsLoading = false.obs;
  RxList<FreelancerHubModel> hubs = <FreelancerHubModel>[].obs;
  RxString dummyCategory = "".obs;

  getHubs({String? search, category}) async {
    if (page.value == 1) {
      hubs.value = [];
      dummyCategory.value = category ?? "";
      getHubsLoading(true);
    }
    var response = await ApiClient.getData(
        '${ApiConstants.freelancerHub}&page=${page.value ?? ""}&searchQ=${search??""}&categorie=${dummyCategory??""}');
    if (response.statusCode == 200) {
      totalPage = jsonDecode(response.body['pagination']['totalPage'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalItem'].toString()) ?? 0;
      var data = List<FreelancerHubModel>.from(response.body["data"].map((x) => FreelancerHubModel.fromJson(x)));
      hubs.addAll(data);
      update();
      getHubsLoading(false);
    } else {
      getHubsLoading(false);
    }
  }





  RxBool myHubLoading = false.obs;
  RxList<MyHubModel> myHubs = <MyHubModel>[].obs;


  getMyHubs({String? search}) async {
    if (page.value == 1) {
      myHubs.value = [];
      myHubLoading(true);
    }
    var response = await ApiClient.getData(
        '${ApiConstants.freelancerAssignedHub}?page=${page.value ?? ""}&searchQ=${search??""}&limit=10');
    if (response.statusCode == 200) {
      totalPage = jsonDecode(response.body['pagination']['totalPage'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalData'].toString()) ?? 0;
      var data = List<MyHubModel>.from(response.body["data"].map((x) => MyHubModel.fromJson(x)));

      myHubs.addAll(data);
      update();

      myHubLoading(false);
    } else {
      myHubLoading(false);
    }
  }



  RxBool gigLoading = false.obs;
  RxList<GigModel> gig = <GigModel>[].obs;

  geGig() async {
    gigLoading(true);

    var response = await ApiClient.getData('${ApiConstants.gig}');
    if (response.statusCode == 200) {

      gig.value  = List<GigModel>.from(response.body["data"].map((x) => GigModel.fromJson(x)));

      gigLoading(false);
    } else {
      gigLoading(false);
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
