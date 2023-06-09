import 'package:flutter/material.dart';

class inputFormat extends StatelessWidget {
  String title;
  String field;
  inputFormat({
    required this.title,
    required this.field,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              maxLines: 1,
              decoration: InputDecoration(
                counterStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
                hintText: field,
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
