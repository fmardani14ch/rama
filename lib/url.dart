import 'package:flutter/material.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/select_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class WIFI_CHECKER extends StatefulWidget {
  @override
  State<WIFI_CHECKER> createState() => _WIFI_CHECKERState();
}
final uri = Uri.http("192.168.4.1");
class _WIFI_CHECKERState extends State<WIFI_CHECKER> {

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
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "تنظیمات دستگاه جدید",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مراحل را بصورت کامل و دقیق مطالعه فرمایید ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " و در انتها روی ادامه کلیک کنید",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "ابتدا ۱۰ ثانیه دست خود را روی پل اول کلید نگه دارید تا کلید وارد حالت تنظیمات شود (زمانی که کلید وارد حالت تنظیمات شود نور های پس زمینه خاموش خواهد شد)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " تلفن خود را روشن کنید  wifi",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "نمایش داده شده مودمی با نام " + "wifi در لیست مودم های ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " را یافته و به آن متصل شوید  RamaSmart",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "(admin123 : پسورد)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "بعد از کلیک روی دکمه ادامه ، در صفحه نمایش داده شده ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " قابل مشاهده می باشد " +
                      "configure wifi و exit" +
                      "دو گزینه ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "اگر قصد اتصال کلید به اینترنت را دارید شناسه دستگاه را",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "کلیک کنید " +
                      "configure wifi " +
                      "یادداشت کرده و روی گزینه ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "کلیک کنید" + "exit " + "در غیر این صورت روی گزینه",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "شده باشید" + "configure wifi " + "درصورتی که وارد گزینه",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "لیست مودم های در دسترس اطراف شما را مشاهده  ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "خواهید کرد مودمی که قصد دارید کلید به آن متصل شود",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "save را انتخاب کرده و پسورد آن را وارد کنید و روی گزینه",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "کلیک کنید.(سایر گزینه ها را وارد نکنید)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "بعداز چند ثانیه نورهای پس زمینه کلید روشن شده و ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " روی کلید به حالت پر نور درآمده که نشان" +
                      " wifi " +
                      "علامت",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "میدهد کلید شما با موفقیت به اینترنت متصل شده است",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () async {
                    // ignore: deprecated_member_use
                    await launchUrl(uri,mode: LaunchMode.externalNonBrowserApplication);
                  },
                  child: Text(
                    "ادامه",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueAccent),
                  )),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      )),
    );
  }
}
