import 'package:cron/cron.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:uts_maktab/auth%20_cubit/auth_cubit.dart';
import 'package:uts_maktab/provider/child_page_provider.dart';
import 'package:http/http.dart' as http;
import 'package:uts_maktab/screens/Authentication/start_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('token');
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    EasyLocalization(
      path: 'assets/locale',
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('uz', 'UZCyrl'),
      ],
      fallbackLocale: const Locale('uz', 'UZ'),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}
// postPhoneToken({required String? parentToken, required String? phoneToken}) async {
//   var endpointUrl = 'https://uts-davomat.uz/admin/api/pupil/save-phone-token';
//
//   Map data = {
//     "parentToken": parentToken,
//     "phoneToken": phoneToken,
//   };
//
//   final res = await http.post(Uri.parse(endpointUrl),
//       headers: {"Content-Type": "application/x-www-form-urlencoded", 'Accept': 'application/json'}, body: data);
//
//   if (res.statusCode == 200) {
//     print('Phone token saved');
//   } else {
//     print('Error on saving phone token');
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<ChildProvider>(create: (context) => ChildProvider()),
            ],
            child: const StartPage(),
          ),
        ),
      ),

    );
  }
}
