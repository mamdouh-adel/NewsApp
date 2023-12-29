import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layouts/home_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.dark),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)
              .copyWith(background: Colors.grey),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(size: 30.0),
              elevation: 20.0,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.deepOrange,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      home: const HomeScreen(),
    );
  }
}
