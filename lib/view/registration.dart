import 'package:bank_management/model/register_request.dart';
import 'package:bank_management/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../controllers/auth_controller.dart';

class Registration extends StatelessWidget {
   Registration({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBEFF0),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 600,
          width: 1200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFDBEFF0).withOpacity(0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Insta bank',
                          style: GoogleFonts.inter(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.lora(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Super'),
                            TextSpan(
                              text: ' GOOD!',
                              style: TextStyle(color: Color(0xFF02A5AA)),
                            ),
                          ],
                        ),
                      ),
                      Text('User Name:',
                          style: GoogleFonts.inter(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          controller: controller.username,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'User Name (Required)*',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            labelStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Email Address:',
                          style: GoogleFonts.inter(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Email Address (Required)*',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            labelStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Password:',
                          style: GoogleFonts.inter(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Obx(() => SizedBox(
                        width: 400,
                        child: TextField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Password (Required)*',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            labelStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: !controller.isPasswordVisible.value,
                        ),
                      )),
                      SizedBox(height: 10),
                      Text('UPI Password:',
                          style: GoogleFonts.inter(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 5),
                      Obx(() => SizedBox(
                        width: 400,
                        child: TextField(
                          controller: controller.upi,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'UPI Password (Required)*',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            labelStyle: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isUPIVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              onPressed: controller.toggleUPIVisibility,
                            ),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: !controller.isPasswordVisible.value,
                        ),
                      )),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 400,
                        child: GestureDetector(
                          onTap: () async{
                            controller.register(
                                RegisterRequest(
                                  email: controller.email.text.trim(),
                                  userName: controller.username.text.trim(),
                                  password: controller.password.text.trim(),
                                  upiPassword: controller.upi.text.trim(),
                                  branch: "Pune",
                                  phoneNumber: "1234567890"
                                )
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFF02A5AA)),
                            child: Text('Login',style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => Login()),
                            child: Text(' Login Now',
                                style: TextStyle(
                                    color: Color(0xFF02A5AA),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/registration.json',
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
