import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/settings_provider.dart';
import 'package:untitled/ui/screens/detial_screen/detials_screen.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(){
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale(provider.currentLocale),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
