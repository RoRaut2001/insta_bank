import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/error_response.dart';

class ApiClient extends GetxService {
  final String baseUrl;
  final SharedPreferences sharedPreferences;

  static final String noInternetMessage = 'connection to api server failed'.tr;
  String token = '';
  String userId = '';
  // late Map<String, String> _mainHeader;
  final int timeoutInSeconds = 40;

  ApiClient({required this.baseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString("token") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }
  //
  // void updateHeaders(String token, String userId) {
  //   _mainHeader = {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer $token"
  //   };
  //   this.userId = userId;
  // }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers, int? timeOut}) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse(baseUrl + uri),
            body: jsonEncode(body),
            headers: headers ??
                {
                  "Content-Type": "application/json",
                  "Authorization": " "
                },
          )
          .timeout(Duration(seconds: timeOut ?? timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (err) {
      print('error $err');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response res, String uri) {
    dynamic body;
    try {
      body = jsonDecode(res.body);
    } catch (err) {
      body = res.body;
      print("body is $body");
    }

    Response response0 = Response(
        body: body ?? res.body,
        bodyString: res.body.toString(),
        request: Request(
            headers: res.request!.headers,
            method: res.request!.method,
            url: res.request!.url),
        headers: res.headers,
        statusCode: res.statusCode,
        statusText: res.reasonPhrase);

    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body! is String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      } else if (response0.statusCode != 200 && response0.body == null) {
        response0 = Response(
          statusCode: 0,
          statusText: noInternetMessage,
        );
      }
    }

    return response0;
  }
}
