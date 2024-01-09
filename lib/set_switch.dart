import 'package:flutter/material.dart';
import 'package:mqtt/custom_functions.dart';
import 'package:mqtt/info.dart';
import 'package:mqtt/model/model.dart';
import 'package:mqtt/select_switch.dart';
import 'package:mqtt/url.dart';
import 'package:url_launcher/url_launcher.dart';

class SET_SWITCH extends StatefulWidget {
  @override
  State<SET_SWITCH> createState() => _SET_SWITCHState();
}

String select_mod = "clasic";

Color a1 = Colors.blueAccent;
Color a2 = Colors.blueAccent;
Color a3 = Colors.blueAccent;
Color b1 = Colors.blueAccent;
Color b2 = Colors.blueAccent;
Color b3 = Colors.blueAccent;
Color c1 = Colors.blueAccent;
Color c2 = Colors.blueAccent;
Color c3 = Colors.blueAccent;
Color d1 = Colors.blueAccent;
Color d2 = Colors.blueAccent;
Color d3 = Colors.blueAccent;
Color e1 = Colors.blueAccent;
Color e2 = Colors.blueAccent;
Color e3 = Colors.blueAccent;
Color f1 = Colors.blueAccent;
Color f2 = Colors.blueAccent;
Color f3 = Colors.blueAccent;

class _SET_SWITCHState extends State<SET_SWITCH> {
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
          child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/ashpazkhaneh.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler1,
                      decoration: InputDecoration(
                          hintText: "آشپزخانه",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: a1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    a1 = Colors.black;
                                    a2 = Colors.blueAccent;
                                    a3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: a2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    a2 = Colors.black;
                                    a1 = Colors.blueAccent;
                                    a3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: a3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    a3 = Colors.black;
                                    a2 = Colors.blueAccent;
                                    a1 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/ashpazkhaneh.jpg";

                              if (switch_count_controler == "1") {
                                setState(() {
                                  switch_counter = 1;
                                });
                              }
                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler1.text,
                              topic_name: topic_name_controler1.text,
                            ));
                            switch_name_controler1.clear();
                            topic_name_controler1.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            Divider(),
            //*************************************************************** */
            //*************************************************************** */

            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/hal.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler2,
                      decoration: InputDecoration(
                          hintText: "حال و پذیرایی",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler2,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: b1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    b1 = Colors.black;
                                    b2 = Colors.blueAccent;
                                    b3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: b2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    b2 = Colors.black;
                                    b3 = Colors.blueAccent;
                                    b1 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: b3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    b3 = Colors.black;
                                    b2 = Colors.blueAccent;
                                    b1 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/hal.jpg";

                              if (switch_count_controler == "1") {
                                setState(() {
                                  switch_counter = 1;
                                });
                              }
                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler2.text,
                              topic_name: topic_name_controler2.text,
                            ));
                            switch_name_controler2.clear();
                            topic_name_controler2.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            Divider(),
            //*********************************************************** */
            //*********************************************************** */
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/hamam.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler3,
                      decoration: InputDecoration(
                          hintText: "حمام",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: c1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    c1 = Colors.black;
                                    c2 = Colors.blueAccent;
                                    c3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: c2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    c2 = Colors.black;
                                    c1 = Colors.blueAccent;
                                    c3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: c3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    c3 = Colors.black;
                                    c2 = Colors.blueAccent;
                                    c1 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/hamam.jpg";

                              if (switch_count_controler == "1") {
                                setState(() {
                                  switch_counter = 1;
                                });
                              }
                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler3.text,
                              topic_name: topic_name_controler3.text,
                            ));
                            switch_name_controler3.clear();
                            topic_name_controler3.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            Divider(),
            //*********************************************************** */
            //*********************************************************** */
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/hayat.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler4,
                      decoration: InputDecoration(
                          hintText: "حیاط",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: d1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    d1 = Colors.black;
                                    d2 = Colors.blueAccent;
                                    d3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: d2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    d2 = Colors.black;
                                    d1 = Colors.blueAccent;
                                    d3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: d3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    d3 = Colors.black;
                                    d1 = Colors.blueAccent;
                                    d2 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/hayat.jpg";

                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler4.text,
                              topic_name: topic_name_controler4.text,
                            ));
                            switch_name_controler4.clear();
                            topic_name_controler4.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            Divider(),
            //*********************************************************** */
            //*********************************************************** */
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/room.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler5,
                      decoration: InputDecoration(
                          hintText: "اتاق",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler5,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: e1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    e1 = Colors.black;
                                    e2 = Colors.blueAccent;
                                    e3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: e2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    e2 = Colors.black;
                                    e1 = Colors.blueAccent;
                                    e3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: e3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    e3 = Colors.black;
                                    e2 = Colors.blueAccent;
                                    e1 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/room.jpg";

                              if (switch_count_controler == "1") {
                                setState(() {
                                  switch_counter = 1;
                                });
                              }
                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler5.text,
                              topic_name: topic_name_controler5.text,
                            ));
                            switch_name_controler5.clear();
                            topic_name_controler5.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            Divider(),
            //*********************************************************** */
            //*********************************************************** */
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/twalet.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: switch_name_controler6,
                      decoration: InputDecoration(
                          hintText: "سرویس بهداشتی",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: topic_name_controler6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " شناسه دستگاه "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(" تعداد پل کلید"),
                        Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "1",
                                  style: TextStyle(color: f1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 1;
                                    f1 = Colors.black;
                                    f2 = Colors.blueAccent;
                                    f3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "2",
                                  style: TextStyle(color: f2),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 2;
                                    f2 = Colors.black;
                                    f1 = Colors.blueAccent;
                                    f3 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                            Expanded(
                                child: Center(
                              child: TextButton(
                                child: Text(
                                  "3",
                                  style: TextStyle(color: f3),
                                ),
                                onPressed: () {
                                  setState(() {
                                    switch_counter = 3;
                                    f3 = Colors.black;
                                    f1 = Colors.blueAccent;
                                    f2 = Colors.blueAccent;
                                  });
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              location_address_controler.text =
                                  "assets/images/twalet.jpg";

                              if (switch_count_controler == "2") {
                                setState(() {
                                  switch_counter = 2;
                                });
                              }
                              if (switch_count_controler == "3") {
                                setState(() {
                                  switch_counter = 3;
                                });
                              }
                            });
                            await box.add(SWITCHBOX(
                              location_address: location_address_controler.text,
                              switch_count: switch_counter,
                              switch_name: switch_name_controler6.text,
                              topic_name: topic_name_controler6.text,
                            ));
                            switch_name_controler6.clear();
                            topic_name_controler6.clear();
                            goto(context, SELECT_SWITCH());
                          },
                          child: Text(
                            "افزودن",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 100,
            )
            //*********************************************************** */
            //*********************************************************** */
          ],
        ),
      )),
    );
  }
}

// void show_switch() {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           actions: [
//             Center(
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     color: Colors.blueAccent,
//                     child: Center(
//                       child: Text(
//                         "انتخاب نوع کلید",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   //////////////////////////////////////////  کلید تک پل
//                   Container(
//                     child: TextButton(
//                         onPressed: () {
//                           if (s1_select == false) {
//                             setState(() {
//                               switch_count = 1;
//                               s1_select = true;
//                               s2_select = false;
//                               s3_select = false;
//                             });
//                           } else {
//                             setState(() {
//                               s1_select = false;
//                             });
//                           }
//                           Navigator.pop(context);
//                           show_switch();
//                         },
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           color: s1_select == false
//                               ? select_item
//                               : Colors.greenAccent,
//                           child: Center(
//                             child: Text("کلید تک پل",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black)),
//                           ),
//                         )),
//                   ), ////////////////////////////////////////// کلید دو پل
//                   Container(
//                     child: TextButton(
//                         onPressed: () {
//                           if (s2_select == false) {
//                             setState(() {
//                               switch_count = 2;
//                               s2_select = true;
//                               s1_select = false;
//                               s3_select = false;
//                             });
//                           } else {
//                             setState(() {
//                               s2_select = false;
//                             });
//                           }
//                           Navigator.pop(context);
//                           show_switch();
//                         },
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           color: s2_select == false
//                               ? select_item
//                               : Colors.greenAccent,
//                           child: Center(
//                             child: Text("کلید دو پل",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black)),
//                           ),
//                         )),
//                   ), /////////////////////////////////////////  کلید سه پل
//                   Container(
//                     child: TextButton(
//                         onPressed: () {
//                           if (s3_select == false) {
//                             setState(() {
//                               switch_count = 3;
//                               s3_select = true;
//                               s2_select = false;
//                               s1_select = false;
//                             });
//                           } else {
//                             setState(() {
//                               s3_select = false;
//                             });
//                           }
//                           Navigator.pop(context);
//                           show_switch();
//                         },
//                         child: Container(
//                           height: 50,
//                           width: double.infinity,
//                           color: s3_select == false
//                               ? select_item
//                               : Colors.greenAccent,
//                           child: Center(
//                             child: Text("کلید سه پل",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black)),
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),

//                   //////////////////////////////////////////// محل نوشتن تاپیک
//                   TextField(
//                     textAlign: TextAlign.right,
//                     controller: topic_name_controler,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: " شناسه دستگاه ",
//                         hintTextDirection: TextDirection.rtl),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                       onPressed: () async {
//                         ////////////////////////////////  ذخیره و ثبت اطلاعات
//                         await box.add(SWITCHBOX(
//                           location_address: switch_location,
//                           switch_count: switch_count,
//                           switch_name: switch_name_controler,
//                           topic_name: topic_name_controler.text,
//                         ));

//                         topic_name_controler.clear();
//                         setState(() {
//                           s1_select = false;
//                           s2_select = false;
//                           s3_select = false;
//                         });
//                         Navigator.pop(context);
//                       },
//                       child: Text("ثبت"))
//                 ],
//               ),
//             )
//           ],
//         );
//       });
// }
