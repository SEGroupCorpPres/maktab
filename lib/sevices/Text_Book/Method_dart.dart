import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uts_maktab/models/class_model.dart';
import 'package:uts_maktab/sevices/Local_Notification_Service/class_servise.dart';
import 'package:uts_maktab/sevices/Text_Book/Video_method_dart.dart';
import 'package:video_player/video_player.dart';
class MethodBook extends StatefulWidget {

  final String  id;
  final String nameuz;

  const MethodBook({Key? key,
    required this.nameuz,
    required this.id,
  }) : super(key: key);

  @override
  State<MethodBook> createState() => _MethodBookState();
}

class _MethodBookState extends State<MethodBook> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  String foos = 'Tilni tanlang';
  String? selectedValue;
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
        leading: IconButton(icon:Icon(Icons.menu),onPressed: ()=> _scaffoldKey.currentState!.openDrawer(),color: Colors.black,),
        title: Text("Darslar",style: TextStyle(color: Colors.black),),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 0,right: 0,top: 35,bottom: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[new Text(widget.nameuz,
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.blue)),
                new Divider(
                  color: Colors.black,
                  height: 5,
                ),
                FutureBuilder<SinfModel?>(
                  future: SinflarFetch().fetchmavzular(int. parse(widget.id)),
                  builder: (BuildContext context,
                      AsyncSnapshot<SinfModel?> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        separatorBuilder: (_,__)=>const Divider(color: Colors.black,),
                        itemBuilder: (context, index) {
                          return ListTile(
                              title:  Text(
                                "${snapshot.data!.data![index].nameUz}"
                                ,textScaleFactor: 1,
                              ),
                              selected: false,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp(
                                  id:"${snapshot.data!.data![index].id}",
                                  fileuz:"${snapshot.data!.data![index].fileUz}",

                                )
                                ));
                              });
                        },
                      );
                    }
                    return Center(
                    );
                  },
                ),
              ],
            ),
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
