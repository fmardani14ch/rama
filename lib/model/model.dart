import 'package:hive/hive.dart';

part 'model.g.dart'; // این را برای Hive تنظیم کنید.

@HiveType(typeId: 1)
class SWITCHBOX extends HiveObject {
  @HiveField(0)
  String switch_name;

  @HiveField(1)
  String location_address;

  @HiveField(2)
  String topic_name;

  @HiveField(3)
  num switch_count;

  SWITCHBOX({
    required this.switch_count,
    required this.switch_name,
    required this.topic_name,
    required this.location_address,
  });
}

@HiveType(typeId: 2)
class CODEBOX extends HiveObject {
  @HiveField(1)
  String code;

  CODEBOX({
    required this.code,
  });
}

//  flutter packages pub run build_runner build
