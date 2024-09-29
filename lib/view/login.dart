import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});

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
                      SizedBox(height: 20,),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.lora(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Unlock Your\nBank'),
                            TextSpan(
                              text: ' Performance!',
                              style: TextStyle(color: Color(0xFF02A5AA)),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/join.png')
                    ],
                  ),
                ),
              ),
              SizedBox(width: 70),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to Insta bank',
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Unlock your back account!',
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    SizedBox(height: 50),
                    Text('Email Address:',
                        style: GoogleFonts.inter(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextField(
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
                    SizedBox(height: 20),
                    Text('Password:',
                        style: GoogleFonts.inter(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Obx(() => SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black)),
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
                    SizedBox(height: 20,),
                    Text('Forgot Password',style: GoogleFonts.inter(
                    color: Colors.black.withOpacity(0.7),
                  fontSize: 10,
                  fontWeight: FontWeight.w500),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 400,
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
                    SizedBox(height: 10,),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        children: [
                          TextSpan(text: 'Don\'t have an account?'),
                          TextSpan(
                            text: ' Register Now',
                            style: TextStyle(color: Color(0xFF02A5AA)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
