import 'package:flutter/material.dart';

void success_alert(BuildContext context, String msg_text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromARGB(228, 21, 137, 231),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
    content: Text(msg_text),
  ));
}

void error_alert(BuildContext context, String msg_text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.redAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
    content: Text(msg_text),
  ));
}

void goto(BuildContext context, Widget screen) {
  Navigator.pop(context);
  Navigator.push((context), MaterialPageRoute(builder: (context) {
    return screen;
  }));
}
