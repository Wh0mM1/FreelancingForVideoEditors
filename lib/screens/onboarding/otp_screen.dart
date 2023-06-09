import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancing_video/screens/onboarding/login_screen.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool isAPIcallProcess = false;
  String otpVal = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 51),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromRGBO(10, 23, 51, 1)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/Frame.png"),
                Container(
                  padding: EdgeInsets.fromLTRB(39, 59, 139, 8),
                  child: Text(
                    "Verify your mobile number",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 24),
                  child: Text(
                    "Please enter the 6-digit verification code",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(122, 124, 124, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(29, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print("hi");
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(20, 32, 59, 1),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            setState(() {
                              otpVal = otpVal + value;
                              print(otpVal);
                            });
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(39, 16, 39, 76),
                  child: Text(
                    "Expect code in 30 seconds",
                    style: TextStyle(color: Color.fromRGBO(122, 124, 124, 1)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(39, 0, 39, 0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 177, 3, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    onPressed: () {
                      // try {
                      //   PhoneAuthCredential credential =
                      //       PhoneAuthProvider.credential(
                      //           verificationId: LogInPage.verify,
                      //           smsCode: otpVal);

                      //   // Sign the user in (or link) with the credential
                      //   await auth.signInWithCredential(credential);
                      //   Navigator.pushNamed(context, "/profilepage");
                      // } catch (e) {
                      //   print("Wrong Otp");
                      // }
                      Navigator.pushNamed(context, "/profilepage");
                      print("Strin");
                      print(otpVal);
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Color.fromRGBO(10, 23, 51, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
