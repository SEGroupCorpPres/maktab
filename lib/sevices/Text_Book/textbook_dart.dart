import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_maktab/auth%20_cubit/auth_cubit.dart';
import 'package:uts_maktab/models/class_model.dart';
import 'package:uts_maktab/screens/Account%20Page/account_page.dart';
import 'package:uts_maktab/screens/ChildInfo%20Page/child_info_page.dart';
import 'package:uts_maktab/screens/Search%20Page/search_page.dart';
import 'package:uts_maktab/sevices/Local_Notification_Service/class_servise.dart';
import 'package:uts_maktab/sevices/Text_Book/Book_dart.dart';

import '../../screens/Watch Page/watch_page.dart';

class TextBook extends StatefulWidget {
  final String id;
  final String nameuz;
  final String nameru;

  TextBook(
      {Key? key, required this.nameuz, required this.id, required this.nameru})
      : super(key: key);

  @override
  State<TextBook> createState() => _TextBookState();
}

class _TextBookState extends State<TextBook> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  String foos = 'Tilni tanlang';
  String? selectedValue;
  final pages = [
    ChildInfoPage(),
    const SecondPage(),
    const ThreethPage(),
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
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
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: Text(
          "Darslar",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 280, bottom: 15, top: 40),
                child: new Text(widget.nameuz,
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
              new Divider(
                color: Colors.black,
                height: 5,
              ),
              FutureBuilder<SinfModel?>(
                future: SinflarFetch().fetchfanlarInfo(int.parse(widget.id)),
                builder:
                    (BuildContext context, AsyncSnapshot<SinfModel?> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      separatorBuilder: (_, __) => const Divider(
                        color: Colors.black,
                      ),
                      itemBuilder: (_, __) {
                        return ListTile(
                            title: Text(
                              context.read<AuthCubit>().selectedLang.index == 1
                                  ? "${snapshot.data!.data![__].nameUz}"
                                  : "${snapshot.data!.data![__].nameRu}",
                              textScaleFactor: 1,
                            ),
                            selected: false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDownload(
                                    id: "${snapshot.data!.data![__].id}",
                                    nameuz:
                                        '${snapshot.data!.data![__].nameUz}',
                                  ),
                                ),
                              );
                            });
                      },
                    );
                  }
                  return Center();
                },
              ),
            ],
          ),
        ),
      ),
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
