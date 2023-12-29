import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';

import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  final List<Widget> _screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
    const SettingsScreen()
  ];

  List<dynamic> _businessArticles = [];
  List<dynamic> get businessArticles => _businessArticles;

  List<dynamic> _sportsArticles = [];
  List<dynamic> get sportsArticles => _sportsArticles;

  List<dynamic> _scienceArticles = [];
  List<dynamic> get scienceArticles => _scienceArticles;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setScreen(int index) {
    _currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  Widget getCurrentScreen() => _screens[_currentIndex];

  getBusinessData() {
    emit(NewsOnLoadingBusinessArticlesState());
    DioHelper.getData(url: "v2/top-headlines", queries: {
      "country": "us",
      "category": "business",
      "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
    })
        .then((value) => {
              // print("DATAVALUE::" + value.data.toString()),
              // print("DATA::" + value.data["articles"].toString()),
              _businessArticles = value.data["articles"],
              emit(NewsSuccessLoadedBusinessArticlesState())
            })
        .onError((error, stackTrace) => {
              //  print("DATAERROR::" + stackTrace.toString()),
              print("Error Occurred: " + error.toString()),
              emit(NewsErrorWhileLoadingBusinessArticlesState(error.toString()))
            });
  }

  getSportsData() {
    emit(NewsOnLoadingSportsArticlesState());
    DioHelper.getData(url: "v2/top-headlines", queries: {
      "country": "us",
      "category": "sports",
      "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
    })
        .then((value) => {
              _sportsArticles = value.data["articles"],
              emit(NewsSuccessLoadedSportsArticlesState())
            })
        .onError((error, stackTrace) => {
              print("Error Occurred: " + error.toString()),
              emit(NewsErrorWhileLoadingSportsArticlesState(error.toString()))
            });
  }

  getScienceData() {
    emit(NewsOnLoadingScienceArticlesState());
    DioHelper.getData(url: "v2/top-headlines", queries: {
      "country": "us",
      "category": "science",
      "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
    })
        .then((value) => {
              _scienceArticles = value.data["articles"],
              emit(NewsSuccessLoadedScienceArticlesState())
            })
        .onError((error, stackTrace) => {
              print("Error Occurred: " + error.toString()),
              emit(NewsErrorWhileLoadingScienceArticlesState(error.toString()))
            });
  }
}
