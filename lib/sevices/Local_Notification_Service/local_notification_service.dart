import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:rxdart/subjects.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> onNoificationClick = BehaviorSubject();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final InitializationSettings settings = InitializationSettings(
      iOS: iosInitializationSettings,
    );

    await _notificationsPlugin.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    return const NotificationDetails(iOS: iosNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _notificationsPlugin.show(id, title, body, details);
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
  }) async {
    final details = await _notificationDetails();
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(DateTime.now().add(Duration(seconds: seconds)), tz.local),
      details,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: false,
    );
  }

  Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _notificationsPlugin.show(id, title, body, details, payload: payload);
  }

  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    print('id: $id');
  }

  Future onSelectNotification(String? payload) async {
    print('payload: $payload');
    if (payload != null && payload.isNotEmpty) {
      onNoificationClick.add(payload);
    }
  }
}

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static void initialize() {
//
//     final InitializationSettings initializationSettings = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
//
//     _notificationsPlugin.initialize(initializationSettings);
//   }
//
//   static void display(RemoteMessage message) async {
//
//     final id = DateTime.now().millisecondsSinceEpoch ~/1000;
//
//     try {
//       final NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//             "utsdavomat",
//             "utsdavomat channel",
//             importance: Importance.max,
//             priority: Priority.high,
//           )
//       );
//
//       await _notificationsPlugin.show(
//           id,
//           message.notification!.title,
//           message.notification!.body,
//           notificationDetails
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//
//   }
// }