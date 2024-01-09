import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/info.dart';
import 'package:mqtt/main.dart';
import 'package:mqtt/model/model.dart';
import 'package:mqtt/model/slide.dart';
import 'package:mqtt/set_switch.dart';
import 'package:mqtt/topic_setting.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mqtt/url.dart';
import 'package:url_launcher/url_launcher.dart';

class SELECT_SWITCH extends StatefulWidget {
  @override
  State<SELECT_SWITCH> createState() => _SELECT_SWITCHState();
}

Color icon_col1 = Colors.black;
Color icon_col2 = Colors.black;
Color icon_col3 = Colors.black;
var box = Hive.box<SWITCHBOX>("newbox");
num switch_counter = int.parse(switch_count_controler.text);
num switchs = 0;
///////////////////////////////////////////////////////////////////
String selected_topic = '';
String selected_location = '';
num selected_number_switch = 0;
///////////////////////////////////////////////////////////////////
Color select_item = Colors.white;
int indexed_screen = 1;
bool s1_select = false;
bool s2_select = false;
bool s3_select = false;
///////////////////////////////////////////////////////////////////
TextEditingController switch_name_controler1 = TextEditingController();
TextEditingController switch_name_controler2 = TextEditingController();
TextEditingController switch_name_controler3 = TextEditingController();
TextEditingController switch_name_controler4 = TextEditingController();
TextEditingController switch_name_controler5 = TextEditingController();
TextEditingController switch_name_controler6 = TextEditingController();
TextEditingController topic_name_controler2 = TextEditingController();
TextEditingController topic_name_controler3 = TextEditingController();
TextEditingController topic_name_controler4 = TextEditingController();
TextEditingController topic_name_controler5 = TextEditingController();
TextEditingController topic_name_controler6 = TextEditingController();
TextEditingController topic_name_controler1 = TextEditingController();
TextEditingController location_address_controler = TextEditingController();
TextEditingController switch_count_controler = TextEditingController();

class _SELECT_SWITCHState extends State<SELECT_SWITCH> {
  _launchURL() async {
    const url = 'https://192.168.1.4';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      indexed_screen = 3;
                    });
                    goto(context, INFO());
                  },
                  child: Image.asset(
                    "assets/images/info.png",
                    scale: 7,
                    color: icon_col1,
                  ),
                )),
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    indexed_screen = 0;
                    icon_col1 = Colors.blueAccent;
                    icon_col2 = Colors.black;
                    icon_col3 = Colors.black;
                  });
                  goto(context, WIFI_CHECKER());
                },
                child: Center(
                  child: Image.asset(
                    "assets/images/wifi.png",
                    color: icon_col1,
                    scale: 15,
                  ),
                ),
              )),
              Expanded(
                child: Center(
                    child: IconButton(
                  color: icon_col2,
                  onPressed: () {
                    setState(() {
                      indexed_screen = 1;
                      icon_col1 = Colors.black;
                      icon_col2 = Colors.blueAccent;
                      icon_col3 = Colors.black;
                      goto(context, SELECT_SWITCH());
                    });
                  },
                  icon: Icon(
                    Icons.home,
                  ),
                )),
              ),
              Expanded(
                child: Center(
                    child: IconButton(
                  color: icon_col3,
                  onPressed: () {
                    setState(() {
                      indexed_screen = 2;
                      icon_col1 = Colors.black;
                      icon_col2 = Colors.black;
                      icon_col3 = Colors.blueAccent;
                      goto(context, SET_SWITCH());
                    });
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                  ),
                )),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 400,
                child: Image.asset("assets/images/1.jpg")
              ),
              Divider(),
              Divider(),
              Expanded(
                  child:box.values.length <1 ? Image.asset("assets/images/empty.jpg") : ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        var item = box.values.toList()[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: ListTile(
                                  title: Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selected_location =
                                                    item.switch_name;

                                                selected_topic =
                                                    item.topic_name;
                                                selected_number_switch =
                                                    item.switch_count;
                                              });
                                              goto(context, TOPIC_SETTING());
                                            },
                                            child: Image.asset(
                                              item.location_address,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              item.switch_name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              item.topic_name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  item.delete();
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                )),
                                          ],
                                        ))
                                      ],
                                    )
                                  ]),
                                )),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: box.values.length);
                },
              )),
            ],
          ),
        ));
  }
}
