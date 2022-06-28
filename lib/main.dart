import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/conect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Destiny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      home: AnimatedSplashScreen(
        splash: const IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Icon(
            Icons.data_exploration,
            size: 200,
          ),
        ),
        duration: 3000,
        //splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
        //nextScreen: const Initial(),
        nextScreen: ConectBluetooth(),
      ),
    );
  }
}
