import 'package:flutter/material.dart';
import 'package:untitled/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTitleTextStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.accent);
  static const TextStyle quarnTitleTextStyle = TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.accent);
  static const TextStyle settingTabTitle = TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.accent);
  static const TextStyle settingtext = TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: AppColors.accent);

}