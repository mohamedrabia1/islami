import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/settings_provider.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
 bool arSwitch = false;
 bool dartModeSwitch = false;
 late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.setting, style: AppTheme.settingTabTitle),
          buildSettingRow("العربية", arSwitch, (newValue) {
            arSwitch = newValue;
            if(arSwitch){
              provider.setCurrentLocale("ar");
            }else{
              provider.setCurrentLocale("en");
            }
          }),
          buildSettingRow(AppLocalizations.of(context)!.darkMode, dartModeSwitch, (newValue) {
            dartModeSwitch = newValue;
            setState(() {});
          })
        ],
      ),
    );
  }

  Widget buildSettingRow(String title , bool switchValue , Function(bool) onChange ){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title, style: AppTheme.settingtext),
        Spacer(),
        Switch(value: switchValue, onChanged: onChange, activeColor: AppColors.primary,)
      ],
    );
  }
}
