import 'package:flutter/material.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/select_switch.dart';

class INFO extends StatefulWidget {
  @override
  State<INFO> createState() => _INFOState();
}

class _INFOState extends State<INFO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goto(context, SELECT_SWITCH());
        },
        child: Text("بازگشت"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset("assets/images/1.png"),
           
              
              SizedBox(height: 50,),Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
