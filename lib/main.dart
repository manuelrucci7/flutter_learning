import 'package:flutter/material.dart';
import 'package:learning/login.dart';
import 'package:learning/app.dart';
import 'package:learning/home.dart';
import 'package:learning/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bottom Nav Example',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Use initialRoute instead of home property
      initialRoute:
          '/app', // This sets AppScreen() as the first screen to be displayed
      routes: {
        '/login': (context) => LoginScreen(),
        '/app': (context) => AppScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
