import 'package:get/get.dart';

class AuthController extends GetxController{

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

}