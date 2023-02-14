import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/bussness_logc/cubit/theme/theme_state.dart';

import '../../../constants/hive_name.dart';
import '../../../constants/theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(theme: AppTheme.lightMode));
  var themeBox = Hive.box(HiveNameTheme.themeDB);
late  int typeTheme;

  changeTheme(int typeTheme)  {
     themeBox.put(HiveNameTheme.checkTheme, typeTheme);
    emit(ThemeState(theme:typeTheme==0?AppTheme.lightMode:AppTheme.darkMode));
  }
  firstAppTheme()  {
    //   print(await themeBox.get(HiveNameTheme.checkTheme, defaultValue: 0));
    typeTheme=themeBox.get(HiveNameTheme.checkTheme, defaultValue: 0);
    emit(ThemeState(theme:typeTheme==0?AppTheme.lightMode:AppTheme.darkMode));
    return typeTheme;

  }
  getTheme()  {
 //   print(await themeBox.get(HiveNameTheme.checkTheme, defaultValue: 0));
    typeTheme=themeBox.get(HiveNameTheme.checkTheme, defaultValue: 0);
// emit(ThemeState(theme:typeTheme==0?AppTheme.lightMode:AppTheme.darkMode));
   return typeTheme;

 }
}
