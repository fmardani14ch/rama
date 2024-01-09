import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:lottie/lottie.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/select_switch.dart';

class SPLASH extends StatefulWidget {
  @override
  State<SPLASH> createState() => _SPLASHState();
}

bool connecting_mod = false;

var vpn = "";
final connectivity_Result = (Connectivity().checkConnectivity());

class _SPLASHState extends State<SPLASH> {
  void check_internet() async {
    final connectivity_Result = await (Connectivity().checkConnectivity());

    setState(() {
      if (connectivity_Result == ConnectivityResult.wifi ||
          connectivity_Result == ConnectivityResult.mobile || connectivity_Result == ConnectivityResult.vpn) {
        print("connected ");
        connecting_mod = true;
      } else {
        print("disconnected");
        connecting_mod = false;
      }
    });
  }

  @override
  void initState() {
    check_internet();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return connecting_mod == true
        ? SELECT_SWITCH()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/lottie/no_internet.json",
                        height: 300, width: 300),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    Container(
                        child: Column(
                      children: [
                        Center(
                          child: Text(
                              maxLines: 3,
                              "اتصال اینترنت خود را چک کرده",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.redAccent)),
                        ),
                        Center(
                          child: Text(
                              maxLines: 3,
                              "و یا فیلتر شکن خود را خاموش کنید ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.redAccent)),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        TextButton(
                            onPressed: () {
                              goto(context, SPLASH());
                            },
                            child: Text("تلاش مجدد",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.redAccent)))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
  }
}
