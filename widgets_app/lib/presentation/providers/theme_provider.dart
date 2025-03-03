import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// el Provider es para valores inmutables
final colorListProvider = Provider((ref) => colorList);

// el StateProvider es para mantener una pieza de estado
final isDarkModeProvider = StateProvider<bool>((ref) => true);

final selectedColorProvider = StateProvider((ref) => 0);

// el StateNotifierProvider es para mantener un estado que puede cambiar
//  la clase para manejar StateNotifierProvider sera ThemeNotifier y el valor sera AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// el StateNotifierProvider es para mantener un estado
class ThemeNotifier extends StateNotifier<AppTheme> {
// STATE= ESTADO = new AppTheme()
// el estado es igual a una nueva instacia del AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectColor: colorIndex);
  }
}
