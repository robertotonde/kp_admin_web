import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kp_admin_web/dashboard/side_navigation_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC-h14Cd8zN1EXrGPtTkp-Fcj4UJH3zNmU",
          authDomain: "kptrans-36668.firebaseapp.com",
          databaseURL: "https://kptrans-36668-default-rtdb.firebaseio.com",
          projectId: "kptrans-36668",
          storageBucket: "kptrans-36668.appspot.com",
          messagingSenderId: "786618579388",
          appId: "1:786618579388:web:3efce190e7ce84d46153b9",
          measurementId: "G-JRMSZPKC0Y"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SideNavigationDrawer(),
    );
  }
}
