import 'package:flutter/material.dart';
import 'package:uts_maktab/sevices/Local_Notification_Service/local_notification_service.dart';

import '../../core/AppTheme/app_size.dart';
import '../../core/AppTheme/app_theme.dart';

class NotAuthPage extends StatefulWidget {
  const NotAuthPage({Key? key}) : super(key: key);

  @override
  _NotAuthPageState createState() => _NotAuthPageState();
}
class _NotAuthPageState extends State<NotAuthPage> {
  late ThemeData themeData;
  late final LocalNotificationService service;
  bool? checkValue = true;
  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MySize.size64!),
              child: Text(
                "Вы не авторизованы",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.headline6,
                  color: themeData.colorScheme.onBackground,
                  letterSpacing: 0.3,
                  fontWeight: 600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size64!, bottom: MySize.size64!),
              child: Icon(
                Icons.emoji_emotions_outlined,
                size: MySize.size64,
                color: themeData.colorScheme.primary,
              ),
            ),
            Text(
              "Для авторизации необходимо\nвойти из телеграма",
              style: AppTheme.getTextStyle(
                themeData.textTheme.subtitle2,
                color: themeData.colorScheme.onBackground,
                letterSpacing: 0,
                fontWeight: 500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}