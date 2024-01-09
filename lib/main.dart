import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mqtt/model/model.dart';
import 'package:mqtt/splash_screen.dart';
import "dart:math";

import 'package:shared_preferences/shared_preferences.dart';

final get_code = code.getString("client");
late final SharedPreferences code;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SWITCHBOXAdapter());
  await Hive.openBox<SWITCHBOX>('newbox');
  code = await SharedPreferences.getInstance();

  Random random = Random();
  int rand = random.nextInt(100000000) + 9876543210;

  if (get_code == null) {
    await code.setString("client", rand.toString());
    print(get_code);
  } else {
    print(get_code);
    print("no code");
  }
  // code.clear();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT MQTT Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SPLASH(),
    );
  }
}
