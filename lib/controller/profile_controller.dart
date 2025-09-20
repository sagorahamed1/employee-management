import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../core/app_constants/app_constants.dart';
import '../helper/prefs_helper.dart';
import '../services/api_client.dart';
import '../services/api_constants.dart';


class ProfileController extends GetxController{
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString image = ''.obs;
  RxString role = ''.obs;
  RxString address = ''.obs;




  getUserLocalData()async{
    name.value = await PrefsHelper.getString(AppConstants.name);
    email.value = await PrefsHelper.getString(AppConstants.email);
    image.value = await PrefsHelper.getString(AppConstants.image);
    role.value = await PrefsHelper.getString(AppConstants.role);
    address.value = await PrefsHelper.getString(AppConstants.address);
    phone.value = await PrefsHelper.getString(AppConstants.number);
  }


  RxBool updateProfileLoading = false.obs;
  updateUserProfile({String? name, String? phone, String? address, File? profileImage})async{
    updateProfileLoading(true);

    List<MultipartBody> files = [MultipartBody("image", profileImage!)];

    var body = {
      "name": "$name",
      "phone": "$phone",
      "address": "$address"
    };
    var response = await ApiClient.patchMultipartData(ApiConstants.profileUpdate, body, multipartBody: files);

    if(response.statusCode == 201 || response.statusCode == 200){
      PrefsHelper.setString(AppConstants.name, name);
      PrefsHelper.setString(AppConstants.number, phone);
      PrefsHelper.setString(AppConstants.address, address);
      PrefsHelper.setString(AppConstants.image, response.body["data"]["image"]);

      Get.back();
      Get.back();
      updateProfileLoading(false);


    }else{

      updateProfileLoading(false);
    }

  }

}