import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:uts_maktab/models/class_model.dart';
import 'package:uts_maktab/screens/Account%20Page/account_page.dart';
import 'package:uts_maktab/screens/ChildInfo%20Page/child_info_page.dart';
import 'package:uts_maktab/screens/Search%20Page/search_page.dart';
import 'package:uts_maktab/screens/Watch%20Page/watch_page.dart';

import 'package:uts_maktab/sevices/Local_Notification_Service/class_servise.dart';
import 'package:uts_maktab/sevices/Text_Book/Method_dart.dart';
import 'package:uts_maktab/sevices/Text_Book/PDF_file_dart.dart';

class BookDownload extends StatefulWidget {
  final String id;
  final String nameuz;

  const BookDownload({
    Key? key,
    required this.nameuz,
    required this.id,
  }) : super(key: key);

  @override
  State<BookDownload> createState() => _BookDownloadState();
}

class _BookDownloadState extends State<BookDownload> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  String foos = 'Tilni tanlang';
  String? selectedValue;
  final pages = [
    ChildInfoPage(),
    SecondPage(),
    const ThreethPage(),
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Drawer Header'),
            ),
            ExpansionTile(
              key: GlobalKey(),
              title: Text(this.foos),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              children: [
                ListTile(
                  title: Text("O'zbekcha"),
                  onTap: () async {
                    context.locale = Locale('uz', 'UZ');
                    setState(() {
                      foos = "O'zbekcha";
                    });
                  },
                ),
                ListTile(
                  title: Text("Русский"),
                  onTap: () async {
                    context.locale = Locale('ru', 'RU');
                    setState(() {
                      foos = "Русский";
                    });
                  },
                ),
                ListTile(
                  title: Text("Ўзбек"),
                  onTap: () async {
                    context.locale = Locale('uz', 'UZCyrl');
                    setState(() {
                      foos = "Ўзбек";
                    });
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.supervisor_account_rounded),
              title: Text('Davomat'.tr()),
              onTap: () {
                if (pageIndex == 0) {
                  Navigator.pop(context);
                  return;
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Telegram bot".tr()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("To'lov".tr()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          color: Colors.black,
        ),
        title: Text(
          "Darslar",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: SinflarFetch().fetchkitoblarInfo(int.parse(widget.id)),
          builder: (BuildContext context, AsyncSnapshot<SinfModel?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, __) {
                    return Card(
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 0, bottom: 15, top: 40),
                          child: Row(
                            children: [
                              new Text(widget.nameuz,
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 200,
                          width: 400,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 80,
                                          child: Image.asset(
                                              "assets/images/pdf.png"),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    "${snapshot.data!.data![__].nameUz}"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            CupertinoButton.filled(
                                                child: Row(
                                                  children: [
                                                    Text("Yuklash"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons.download),
                                                  ],
                                                ),
                                                onPressed: () async {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => PDF(
                                                              fileUz:
                                                                  "${snapshot.data!.data![__].fileUz}")));
                                                })
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black,
                            margin: EdgeInsets.all(20),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 400,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 80,
                                          child: Image.asset(
                                              "assets/images/video.png"),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("Videolarni ko'rish"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            CupertinoButton.filled(
                                                child: Row(
                                                  children: [
                                                    Text("Videolar"),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Icon(
                                                        Icons.video_collection),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => MethodBook(
                                                          nameuz:
                                                              '${snapshot.data!.data![__].nameUz}',
                                                          id: "${snapshot.data!.data![__].id}"),
                                                    ),
                                                  );
                                                })
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black,
                            margin: EdgeInsets.all(20),
                          ),
                        ),
                      ]),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              // topLeft: Radius.circular(20),
              // topRight: Radius.circular(20),
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home,
                      color: Colors.blue,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 35,
                    )
                  : const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.videocam,
                      color: Colors.blue,
                      size: 35,
                    )
                  : const Icon(
                      Icons.videocam,
                      color: Colors.black,
                      size: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FourthPage()));
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 35,
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 35,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
