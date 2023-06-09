import 'package:flutter/material.dart';
import 'package:freelancing_video/screens/widget/appbar_widget.dart';
import 'package:freelancing_video/screens/widget/inputFormat.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, Icon(Icons.account_circle)),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3)),
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "Contact Form",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(10, 23, 51, 1),
              ),
            ),
            inputFormat(title: "Client Name:", field: "Name"),
            inputFormat(title: "Contact Number:", field: "Number"),
            inputFormat(title: "Subject:", field: "What you wanna know about?"),
            inputFormat(title: "Describe:", field: "Description"),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profilepage');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(28, 53, 107, 1),
                    border: Border.all(
                      color: Color.fromRGBO(10, 23, 51, 1).withOpacity(0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black.withOpacity(0.4))
                    ]),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
