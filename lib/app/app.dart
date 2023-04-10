
import 'package:flutter/material.dart';
import 'package:task_manager/app/view/home/home_page.dart';
import 'package:task_manager/app/view/splash/splash_page.dart';
import 'package:task_manager/app/view/task_list/task_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF008ae6);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Hack',
          bodyColor: textColor,
          displayColor: textColor,
        ),
      ),
      home: SplashPage(),
    );
  }
}