import 'package:fire_chat/FCM/fcm_service.dart';
import 'package:fire_chat/firebase_options.dart';
import 'package:fire_chat/model/model/authentication_model.dart';
import 'package:fire_chat/model/model/authentication_model_impl.dart';
import 'package:fire_chat/model/model/data_model.dart';
import 'package:fire_chat/model/model/data_model_impl.dart';
import 'package:fire_chat/network/realtime_database_agent.dart';
import 'package:fire_chat/pages/home_page.dart';
import 'package:fire_chat/pages/login_page.dart';
import 'package:fire_chat/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FCMService().listenForMessages();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  DataModel dataModel = DataModelImpl();
  AuthenticationModel authenticationModel = AuthenticationModelImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (authenticationModel.isLoggedIn()) ? HomePage() : LoginPage(),
    );
  }
}
