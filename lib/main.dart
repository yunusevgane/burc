import 'state_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'anasayfa.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StateData().createStatePrefObject();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ChangeNotifierProvider<StateData>(
      create: (BuildContext context) {
        return StateData();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StateData>(context, listen: false).ilkadim();
    Color renk1 = Color(0xFF022b54);
    Color renk2 = Color(0xFF5a9dd1);
    Color renk3 = Color(0xFF02345d);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: renk3, // <-- SEE HERE
          onSurface: renk3, // <-- SEE HERE
        ),
        primaryColor: renk3,
        primaryColorLight: renk1,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: renk1,
        drawerTheme: DrawerThemeData(
          backgroundColor: renk1,
        ),
        appBarTheme: AppBarTheme(
          color: renk3,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          color: renk3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: renk3, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home: anasayfa(),
    );
  }
}
