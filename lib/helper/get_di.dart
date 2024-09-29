import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';

Future<void> init() async{
  Get.lazyPut(()=>AuthController(), fenix: true);


}