import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  final List<Widget> _screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
    const SettingsScreen()
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setScreen(int index) {
    _currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  Widget getCurrentScreen() => _screens[_currentIndex];
}
