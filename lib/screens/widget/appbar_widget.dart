import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Color.fromRGBO(10, 23, 51, 1),
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    ],
  );
}
