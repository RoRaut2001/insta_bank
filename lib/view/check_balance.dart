import 'package:bank_management/model/get_balance_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/auth_controller.dart';
import 'login.dart';

class CheckBalance extends StatelessWidget {
  CheckBalance({super.key});

  final AuthController controller = Get.find<AuthController>();
  // Function to show the alert dialog for UPI PIN input
  Future<void> showUPIPinDialog(BuildContext context) async {
    TextEditingController pinController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter UPI PIN'),
          content: TextField(
            controller: pinController,
            keyboardType: TextInputType.number,
            maxLength: 4,
            obscureText: true, // To hide the PIN
            decoration: InputDecoration(
              hintText: 'Enter 4-digit UPI PIN',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                var request = GetBalanceRequest(
                  id: controller.userInfo.value!.userData!.uid ??
                      "pSYt8jzbNuMRQlVwg3p429fiqRE3",
                  upiPassword: pinController.text.trim(),
                );

                print("Sending request: ${request.toJson()}");

                await controller.getAccountBalance(request);

                if (controller.accountBalance.isNotEmpty) {
                  Navigator.pop(context);
                } else {
                  print("No balance retrieved.");
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.monetization_on, color: Color(0xFF02A5AA)),
                          SizedBox(width: 5),
                          Text('Insta bank',
                              style: GoogleFonts.inter(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Expanded(
                              child: GestureDetector(
                                  onTap: controller.logout,
                                  child: Row(
                                    children: [
                                      Text('Logout',
                                          style: GoogleFonts.inter(
                                              color: Color(0xFF02A5AA),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.logout,
                                        color: Color(0xFF02A5AA),
                                        size: 15,
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: GoogleFonts.lora(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Investing Money\n'),
                            TextSpan(
                              text: 'Investing Your Future!',
                              style: TextStyle(color: Color(0xFF02A5AA)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          '"Your balance reflects not just your savings, '
                          'but the security and peace of mind you\'ve earned."',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: FontWeight.normal)),
                      SizedBox(height: 60),
                      SizedBox(
                        width: 400,
                        child: GestureDetector(
                          onTap: () {
                            showUPIPinDialog(context); // Show UPI PIN dialog
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFF02A5AA)),
                            child: Text('Check Bank Balance',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: Container(
                          // Use Obx to reactively display the balance
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF02A5AA).withOpacity(0.05),
                          ),
                          child: Obx(() => Text(
                              'Current Balance: ₹${controller.accountBalance.value}')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/loading.json',
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
