import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:uts_maktab/models/language_data.dart';
import 'package:uts_maktab/models/language_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Language selectedLang=LangData.languageList[0];
  void selectLanguage(lang){
    selectedLang = lang;
  }

  Future<void> selectSettingLan(Language language,BuildContext context) async{
    selectedLang=language;
    if (selectedLang.langName == "O'zbekcha") {
      await context.setLocale(const Locale('uz', 'UZ'));
    } else if (selectedLang.langName == "Ўзбекча") {
      await context.setLocale(const Locale('uz', 'UZCyrl'));
    } else {
      await context.setLocale(const Locale('ru', 'RU'));
    }

  }
}
