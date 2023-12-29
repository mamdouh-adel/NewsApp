import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_cubit/app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInit());

  static AppCubit get(context) => BlocProvider.of(context);

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void changeAppThemeMode() {
    _isDarkMode = !_isDarkMode;
    emit(_isDarkMode
        ? AppStateChangeThemeModeToDark()
        : AppStateChangeThemeModeToLight());
  }
}
