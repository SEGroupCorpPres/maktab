import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_maktab/auth%20_cubit/auth_cubit.dart';
import 'package:uts_maktab/models/language_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uts_maktab/globals.dart' as globals;
import '../Account Page/account_page.dart';
import '../ChildInfo Page/child_info_page.dart';
import '../Search Page/search_page.dart';
import '../Watch Page/watch_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void setlocale(Locale locale) => context.setLocale(context.locale);
  int pageIndex = 0;
  String foos = 'Tilni tanlang';
  String? selectedValue;
  void _launchURL() async {
    String url = "https://uts-davomat.uz";
    await launch(url);
  }

  void _launchTelegram() async {
    String url = "https://t.me/utsDavomatBot";
    await launch(url);
  }
  void _launchPaymentURL() async {
    await launch(globals.pay_link);
  }
  Future<void> initDynamicLinks() async {}
  final pages = [
    ChildInfoPage(),
    const SecondPage(),
    const ThreethPage(),
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    setlocale(context.locale);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit = context.watch();
        context
            .read<AuthCubit>()
            .selectLanguage(LangData.languageList.singleWhere((element) => element.locale == context.locale));
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              "Davomat".tr(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
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
                  title: Text(foos),
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                  children: [
                    ListTile(
                      title: const Text("O'zbekcha"),
                      onTap: () async {
                        context.locale = const Locale('uz', 'UZ');
                        setState(() {
                          foos = "O'zbekcha";
                        });
                      },
                    ),
                    ListTile(
                      title: const Text("Русский"),
                      onTap: () async {
                        context.locale = const Locale('ru', 'RU');
                        setState(() {
                          foos = "Русский";
                        });
                      },
                    ),
                    ListTile(
                      title: const Text("Ўзбек"),
                      onTap: () async {
                        context.locale = const Locale('uz', 'UZCyrl');
                        setState(() {
                          foos = "Ўзбек";
                        });
                      },
                    )
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.supervisor_account_rounded),
                  title: Text('Davomat'.tr()),
                  onTap: () {
                    if (pageIndex == 0) {
                      Navigator.pop(context);
                      return;
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.send),
                  title: Text("Telegram bot".tr()),
                  onTap: () {
                    _launchTelegram();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text("To'lovlar"),
                  onTap: () {
                    _launchPaymentURL();
                  },
                ),
              ],
            ),
          ),
          body: pages[pageIndex],
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
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
      },
    );
  }
}
