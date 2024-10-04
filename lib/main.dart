import 'package:bank_management/view/check_balance.dart';
import 'package:bank_management/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async {
  await di.init();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});
  @override
  Widget build(BuildContext context) {
    String? uid = sharedPreferences.getString("uid");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta Bank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: uid == null || uid.isEmpty ? Login() : CheckBalance(),
    );
  }
}
