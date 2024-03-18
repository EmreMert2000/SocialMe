import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/FeedScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCWGxdYFlN0eHIE9VDaLWKNGI4jVg54XUE",
        appId: "1:511076913238:web:0e6283d140779358036bf7",
        messagingSenderId: "511076913238",
        projectId: "socialme-f31b9"
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Me',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginScreen(),
    );
  }
}
