import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_cubit/app_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInit());

  static AppCubit get(context) => BlocProvider.of(context);

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  Future changeAppThemeMode({bool? isDarkMode}) async {
    if (isDarkMode != null) {
      _isDarkMode = isDarkMode;
    } else {
      _isDarkMode = !_isDarkMode;
    }

    await CacheHelper.setBool("IsDarkMode", _isDarkMode);

    emit(_isDarkMode
        ? AppStateChangeThemeModeToDark()
        : AppStateChangeThemeModeToLight());
  }
}
