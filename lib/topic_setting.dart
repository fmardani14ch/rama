import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/info.dart';
import 'package:mqtt/main.dart';
import 'package:mqtt/model/model.dart';
import 'package:mqtt/select_switch.dart';
import 'package:mqtt/set_switch.dart';
import 'package:mqtt/url.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:url_launcher/url_launcher.dart';

bool s1 = false; //
bool s2 = false;
bool s3 = false;
bool s1_bool = false;
bool s2_bool = false;
bool s3_bool = false;
var s1_l = "";
var s2_l = "";
var s3_l = "";

class TOPIC_SETTING extends StatefulWidget {
  @override
  _TOPIC_SETTINGState createState() => _TOPIC_SETTINGState();
}

class _TOPIC_SETTINGState extends State<TOPIC_SETTING> {
  late Timer _reconnectTimer;
  late MqttClient client;
  String broker = 'services.irn5.chabokan.net';
  String clientId = get_code!;
  String topic = selected_topic;

  @override
  void initState() {
    super.initState();

    _connect();
    _subscribeToTopic();

    // _reconnectTimer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   _reconnectIfNeeded();
    // });
  }

  void _reconnectIfNeeded() {
    if (client.connectionStatus!.state != MqttConnectionState.connected) {
      _connect();
      _subscribeToTopic();
    }
  }

  @override
  void dispose() {
    _reconnectTimer.cancel(); // لغو تایمر قبل از خروج
    super.dispose();
  }

  void _subscribeToTopic() async {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      client.subscribe(topic + "-l", MqttQos.atMostOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> event) {
        final MqttPublishMessage receivedMessage =
            event[0].payload as MqttPublishMessage;
        final String payload = MqttPublishPayload.bytesToStringAsString(
            receivedMessage.payload.message);
        print(
            '***** ****** ****** ****** ******: $payload from topic: ${event[0].topic}');
        if (payload == "on") {
          setState(() {
            s1_l = "on";
            s1_bool = true;
          });
        }
        if (payload == "on2") {
          setState(() {
            s2_l = "on2";
            s2_bool = true;
          });
        }
        if (payload == "on3") {
          setState(() {
            s3_l = "on3";
            s3_bool = true;
          });
        }
        if (payload == "off") {
          setState(() {
            s1_l = "off";
            s1_bool = false;
          });
        }
        if (payload == "off2") {
          setState(() {
            s2_l = "off2";
            s2_bool = false;
          });
        }
        if (payload == "off3") {
          setState(() {
            s3_l = "off3";
            s3_bool = false;
          });
        }
      });
    }
  }

  _connect() async {
    client = MqttServerClient(broker, clientId);
    client.port =your mqtt server port  ;
    client.keepAlivePeriod = 600;

    client.logging(on: true);

    await client.connect("username server", "password server");
    client.onDisconnected = _onDisconnected;
    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .authenticateAs('username server', 'password server');

    try {
      _subscribeToTopic();
    } catch (e) {
      _reconnectIfNeeded();
    }
  }

  _sendMessage(String message) {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
      print(message);
    } else {
      print("disconnected");
    }
  }

  _onDisconnected() {
    print('Disconnected');
  }

  @override
  Widget build(BuildContext context) {
    print(client);
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
      appBar: AppBar(title: Center(child: Text('Rama Smart'))),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    topic,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "شناسه دستگاه ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    selected_location,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "محل دستگاه  ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: selected_number_switch >= 1
                          ? Switch(
                              inactiveTrackColor:
                                  Color.fromARGB(255, 105, 104, 104),
                              value: s1,
                              onChanged: (value) {
                                if (s1 == false) {
                                  setState(() {
                                    s1 = true;
                                    _sendMessage("on");
                                  });
                                } else {
                                  setState(() {
                                    s1 = false;
                                    _sendMessage("off");
                                  });
                                }
                              })
                          : SizedBox())),
              Expanded(
                child: selected_number_switch >= 1
                    ? Icon(
                        Icons.lightbulb,
                        color: s1_bool == true ? Colors.yellow : Colors.grey,
                      )
                    : SizedBox(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: selected_number_switch >= 2
                          ? Switch(
                              inactiveTrackColor:
                                  Color.fromARGB(255, 105, 104, 104),
                              value: s2,
                              onChanged: (value) {
                                if (s2 == false) {
                                  setState(() {
                                    s2 = true;
                                    _sendMessage("on2");
                                  });
                                } else {
                                  setState(() {
                                    s2 = false;
                                    _sendMessage("off2");
                                  });
                                }
                              })
                          : SizedBox())),
              Expanded(
                child: selected_number_switch >= 2
                    ? Icon(
                        Icons.lightbulb,
                        color: s2_bool == true ? Colors.yellow : Colors.grey,
                      )
                    : SizedBox(),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: selected_number_switch >= 3
                          ? Switch(
                              inactiveTrackColor:
                                  Color.fromARGB(255, 105, 104, 104),
                              value: s3,
                              onChanged: (value) {
                                if (s3 == false) {
                                  setState(() {
                                    s3 = true;
                                    _sendMessage("on3");
                                  });
                                } else {
                                  setState(() {
                                    s3 = false;
                                    _sendMessage("off3");
                                  });
                                }
                              })
                          : SizedBox())),
              Expanded(
                child: selected_number_switch >= 3
                    ? Icon(
                        Icons.lightbulb,
                        color: s3_bool == true ? Colors.yellow : Colors.grey,
                      )
                    : SizedBox(),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 50,
          ), ////////////////////////////////////////////////  نسخه تست
        
        ],
      ),
    );
  }
}
