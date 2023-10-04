import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
String currentLocale = "en";


void setCurrentLocale(String newLocale){
  currentLocale = newLocale;
  notifyListeners();
}

}