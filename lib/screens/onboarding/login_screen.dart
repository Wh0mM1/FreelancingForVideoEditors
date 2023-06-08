import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static String verify = "";
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String mobileNumber = ' ';
  bool enableBtn = false;
  bool isAPIcallProcess = false;
  String otpPin = " ";
  String countryDial = "+91";

  @override
  void initState() {
    super.initState();
    mobileNumber = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loginUI(context),
        // ProgressHUD(
        //   child: _loginUI(context),
        //   opacity: 0.3,
        //   key: UniqueKey(),
        //   inAsyncCall: isAPIcallProcess,
        // ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 51),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(10, 23, 51, 1)),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/images/Frame.png"),
            Container(
              padding: EdgeInsets.fromLTRB(39, 59, 139, 8),
              child: Text(
                "Enter your mobile number",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(39, 0, 89, 32),
              child: Text(
                "You will receive a 4 digit code verification",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(122, 124, 124, 1),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(20, 32, 59, 1),
              ),
              margin: EdgeInsets.fromLTRB(39, 0, 40, 0),
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  hintText: "+91 7219XXXXXX",
                ),
                onChanged: (String value) {
                  mobileNumber = value;
                  enableBtn = true;
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(39, 70, 39, 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 177, 3, 1),
                  borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                onPressed: () async {
                  print("hi");
                  mobileNumber = mobileNumber;
                  print(mobileNumber);
                  if (mobileNumber.length == 10) {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+91 ' + mobileNumber,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        print("verror");
                        print(e);
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        LogInPage.verify = verificationId;
                        Navigator.pushNamed(context, "/otp");
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  }
                  // Navigator.pushNamed(context, '/otp');
                  print("code sent");
                  // Navigator.pushNamed(context, "/otp");
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
    );
  }
}
