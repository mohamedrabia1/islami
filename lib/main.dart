import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/detial_screen/detials_screen.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';

void main(){
  runApp(
    MaterialApp(

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    )
  );
}