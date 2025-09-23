import 'dart:convert';
import 'dart:io';

import 'package:droke/core/config/app_route.dart';
import 'package:droke/helper/toast_message_helper.dart';
import 'package:droke/models/my_hub_model.dart';
import 'package:droke/models/service_details_model.dart';
import 'package:droke/models/service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/hub_model.dart';
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

    var response =
        await ApiClient.getData('${ApiConstants.servicesDetails}/${serviceId}');

    print("============res : ${response.body} resCode: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {

      serviceDetails.value = ServiceDetailsModel.fromJson(response.body["data"]);

      update();
      serviceDetailsLoading(false);
    } else {
      serviceDetailsLoading(false);
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

  getMyHubs({String? search}) async {
    if (page.value == 1) {
      myHubs.value = [];
      myHubLoading(true);
    }
    var response = await ApiClient.getData(
        '${ApiConstants.myHubs}?page=${page.value ?? ""}&searchQ=${search??""}&limit=10');
    if (response.statusCode == 200) {
      totalPage = jsonDecode(response.body['pagination']['totalPages'].toString()) ?? 0;
      totalResult = jsonDecode(response.body['pagination']['totalCount'].toString()) ?? 0;
      var data = List<MyHubModel>.from(response.body["data"].map((x) => MyHubModel.fromJson(x)));
      myHubs.addAll(data);
      update();
      myHubLoading(false);
    } else {
      myHubLoading(false);
    }
  }




}
