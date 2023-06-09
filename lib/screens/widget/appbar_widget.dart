import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, Icon icon) {
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
        icon: icon,
        color: Colors.white,
      ),
    ],
  );
}
