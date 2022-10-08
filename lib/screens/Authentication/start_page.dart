import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../core/AppTheme/app_size.dart';
import '../Home Page/home_page.dart';
import 'not_auth_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late ThemeData themeData;
  bool? checkValue;

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
    statFromSession();
  }

  // Do you want to open "https://uut.page.link/?link=https://uts-davomat.uz/telegram/index?token=35344907e3d9e06edb6528b8a3b3d5c6&apn=uz.maktab.smarttech&afl=https://play.google.com/store/apps/details?id=uz.maktab.smarttech"?

  void statFromSession() async {
    print('start');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    String? token = Hive.box('token').get('token');
    if (token != null) {
      // globals.token = token;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotAuthPage()),
      );
    }
  }

  String getToken(String link) {
    print(link);
    int index = link.indexOf('token') + 6;
    int indexApn = link.indexOf('&') - 1;
    if (index == null) {
      return 'ldfhgdfg';
    }
    String token = link.substring(index, indexApn);
    return token;
  }

  // https://uut.page.link/?link=https://uts-davomat.uz/telegram/index?token%3D35344907e3d9e06edb6528b8a3b3d5c6&apn=uz.maktab.smarttech&afl=https://play.google.com/store/apps/details?id=uz.maktab.smarttech
  void initDynamicLinks() async {
    // this is called when app is background
    print('init dynamic link');

     FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData? dynamicLink) async {
      // 'https://uut.page.link/?link=https://uts-davomat.uz/telegram/index?token%3D35344907e3d9e06edb6528b8a3b3d5c6&'
      final Uri deepLink = dynamicLink!.link;
      String token = getToken(deepLink.scheme);
      await Hive.box('token').put('token', token);
      await postPhoneToken(parentToken: token, phoneToken: token);
    }, onError: (e) async {
      print('onLinkError');
      print(e.message);
    });

    // this called when app is foreground
    // final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    // final Uri? deepLink = data?.link;
    //
    // if (deepLink != null) {
    //   print('galdi');
    //   String token = deepLink.queryParameters['token'].toString();
    //   await Hive.box('token').put('token', token);
    //
    //   // SharedPreferences prefs = await SharedPreferences.getInstance();
    //   // globals.token = token;
    //   // await prefs.setString('token', token);
    //
    //   // return _showDialog();
    //
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyHomePage()),
    //   );
    //
    //   print(deepLink.toString());
    //   Navigator.pushNamed(context, deepLink.path);
    // }
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
      home: Scaffold(
        backgroundColor: themeData.backgroundColor,
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  themeData.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  postPhoneToken({required String? parentToken, required String? phoneToken}) async {
    var endpointUrl = 'https://uts-davomat.uz/admin/api/pupil/save-phone-token';
    Map data = {
      "parentToken": parentToken,
      "phoneToken": phoneToken,
    };
    final res = await http.post(Uri.parse(endpointUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded", 'Accept': 'application/json'}, body: data);
    if (res.statusCode == 200) {
      print('Phone token saved');
    } else {
      print('Error on saving phone token');
    }
  }
}
