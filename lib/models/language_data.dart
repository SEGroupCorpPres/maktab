import 'package:flutter/material.dart';
import 'package:uts_maktab/models/language_model.dart';

class LangData {
  static final List<Language> languageList = [
    Language(
      index: 1,
      langName: "O'zbekcha",
      locale: const Locale('uz', 'UZ'),
    ),
    Language(
      index: 2,
      langName: "Ўзбекча",
      locale: const Locale('uz', 'UZCyrl'),
    ),
    Language(
      index: 3,
      langName: "Русский",
      locale: const Locale('ru', 'RU'),
    ),
  ];
}