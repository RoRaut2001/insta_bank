import 'package:bank_management/helper/api_client.dart';
import 'package:bank_management/helper/urls.dart';
import 'package:bank_management/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/auth_controller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(
      () => ApiClient(baseUrl: baseUrl, sharedPreferences: sharedPreferences));
  Get.lazyPut(() => AuthRepository(
      apiClient: Get.find(), sharedPreferences: sharedPreferences));

  Get.lazyPut(
      () => AuthController(
          authRepository: AuthRepository(
              apiClient: Get.find(), sharedPreferences: sharedPreferences), sharedPreferences: sharedPreferences, ),
      fenix: true);
}
