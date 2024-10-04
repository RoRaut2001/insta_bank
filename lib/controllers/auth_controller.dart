import 'dart:convert';
import 'package:bank_management/model/get_balance_request.dart';
import 'package:bank_management/model/get_balance_response.dart';
import 'package:bank_management/model/login_request_model.dart';
import 'package:bank_management/model/login_response_model.dart';
import 'package:bank_management/repository/auth_repository.dart';
import 'package:bank_management/view/check_balance.dart';
import 'package:bank_management/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/register_request.dart';
import '../model/register_response_model.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  final SharedPreferences sharedPreferences;

  AuthController({required this.authRepository, required this.sharedPreferences});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController upi = TextEditingController();

  var isPasswordVisible = false.obs;
  var isUPIVisible = false.obs;
  var userInfo = Rxn<LoginResponseModel>();
  var registeredInfo = Rxn<RegisterResponseModel>();
  var accountBalance = ''.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void toggleUPIVisibility() {
    isUPIVisible.value = !isUPIVisible.value;
  }

  var pin = ''.obs;
  var balance = ''.obs;

  void validateUPIPin(String enteredPin) {
    if (enteredPin.length == 4) {
      pin.value = enteredPin;
      balance.value = "₹5000.00";
    } else {
      balance.value = '';
    }
  }

  Future<RegisterResponseModel?> register(RegisterRequest req) async {
    try {
      Response response = await authRepository.register(req);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody;

        try {
          if (response.body is String) {
            responseBody = jsonDecode(response.body) as Map<String, dynamic>;
          } else if (response.body is Map<String, dynamic>) {
            responseBody = response.body as Map<String, dynamic>;
          } else {
            throw Exception("Unexpected response body type: ${response.body.runtimeType}");
          }
        } catch (e) {
          print("Error decoding response body: $e");
          return null;
        }

        try {
          RegisterResponseModel responseModel = RegisterResponseModel.fromJson(responseBody);
          registeredInfo.value = responseModel;
          print("User Registered with UID: ${registeredInfo.value!.userData!.uid}");
          sharedPreferences.setString("uid", registeredInfo.value!.userData!.uid ?? "");
          update();
          Get.to(() => Login());
          return responseModel;
        } catch (e) {
          print("Error parsing RegisterResponseModel: $e");
          return null;
        }
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Exception during registration: ${e.toString()}");
    } finally {
      update();
      clearControllers();
    }
    return null;
  }


  Future<LoginResponseModel?> login(LoginRequestModel req) async {
    try {
      update();
      Response response = await authRepository.login(req);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody;
        try {
          if (response.body is String) {
            responseBody = jsonDecode(response.body) as Map<String, dynamic>;
          } else if (response.body is Map<String, dynamic>) {
            responseBody = response.body as Map<String, dynamic>;
          } else {
            throw Exception(
                "Unexpected response body type: ${response.body.runtimeType}");
          }
        } catch (e) {
          return null;
        }
        try {
          LoginResponseModel responseModel =
              LoginResponseModel.fromJson(responseBody);
          userInfo.value = responseModel;
          print(userInfo.value!.userData!.uid);
          sharedPreferences.setString("uid", userInfo.value!.userData!.uid ?? "");
          update();
          Get.to(()=>CheckBalance());
          return responseModel;
                  } catch (e) {
          print("Error parsing LoginResponseModel: $e");
          return null;
        }
      } else {}
    } catch (e) {
      print("Exception--->" + e.toString());
    } finally {
      update();
      clearControllers();
    }
    return null;
  }

  Future<GetBalanceResponse?> getAccountBalance(GetBalanceRequest req) async {
    try {
      update();
      Response response = await authRepository.getBalance(req);
      print("API Call Status Code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody;
        try {
          if (response.body is String) {
            responseBody = jsonDecode(response.body) as Map<String, dynamic>;
          } else if (response.body is Map<String, dynamic>) {
            responseBody = response.body as Map<String, dynamic>;
          } else {
            throw Exception(
              "Unexpected response body type: ${response.body.runtimeType}",
            );
          }
        } catch (e) {
          print("Error decoding response body: $e");
          return null;
        }
        try {
          GetBalanceResponse responseModel = GetBalanceResponse.fromJson(responseBody);
          accountBalance.value = responseModel.accountBalance.toString();
          print("Balance: ${accountBalance.value}");
          update();
          return responseModel;
        } catch (e) {
          print("Error parsing GetBalanceResponse: $e");
          return null;
        }
      } else {
        print("Unexpected status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception during API call: $e");
    } finally {
      clearControllers();
      update();
    }
    return null;
  }

  void clearControllers(){
    username.clear();
    email.clear();
    upi.clear();
    password.clear();
  }

  Future<void> logout() async{
    Get.to(()=>Login());
    sharedPreferences.clear();
  }

// Future<LoginResponseModel?> login(LoginRequestModel req) async{
  //   try {
  //     Response response = await authRepository.login(req);
  //     if(response.statusCode == 200 || response.statusCode == 201){
  //       Map<String, dynamic> responseBody;
  //       try{
  //         if(response.body is String){
  //           responseBody = jsonDecode(response.body) as Map<String, dynamic>;
  //         }else if(response.body is Map<String, dynamic>){
  //           responseBody = response.body as Map<String, dynamic>;
  //         }else {
  //           throw Exception(
  //             "Unknown Body Type"
  //           );
  //         }
  //       }catch(e){
  //         print('error $e');
  //       }
  //       try{
  //         LoginResponseModel loginResponse = LoginResponseModel.fromJson(responseBody);
  //       }catch(completeError){}
  //     }
  //   } catch (err) {
  //     print('error $err');
  //   }
  // }
}
