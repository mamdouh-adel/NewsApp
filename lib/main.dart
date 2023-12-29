import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/app_cubit/app_cubit.dart';
import 'package:news_app/app_cubit/app_states.dart';
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
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) => {},
          builder: (context, state) {
            var appCubit = AppCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'News App',
              theme: _getLightTheme(),
              darkTheme: _getDarkTheme(),
              home: const HomeScreen(),
              themeMode: appCubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            );
          },
        ));
  }

  ThemeData _getLightTheme() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
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
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  ThemeData _getDarkTheme() {
    return ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: HexColor("333739"),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("333739"),
            statusBarBrightness: Brightness.dark),
        backgroundColor: HexColor("333739"),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)
          .copyWith(background: Colors.grey),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(size: 30.0),
        elevation: 20.0,
        backgroundColor: HexColor("333739"),
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
