
import 'package:bank_management/helper/urls.dart';
import 'package:bank_management/model/get_balance_request.dart';
import 'package:bank_management/model/login_request_model.dart';
import 'package:bank_management/model/register_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/api_client.dart';

class AuthRepository {

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({ required this.apiClient, required this.sharedPreferences});

  Future<Response> login( LoginRequestModel req) async{
    return await apiClient.postData(loginUrl, req.toJson());
  }
  Future<Response> register( RegisterRequest req) async{
    return await apiClient.postData(RegisterUrl, req.toJson());
  }
  Future<Response> getBalance( GetBalanceRequest req) async{
    return await apiClient.postData(balanceUrl, req.toJson());
  }

}