import 'package:flutter/material.dart';
import 'package:untitled/models/details_screen_args.dart';
import 'package:untitled/ui/utils/app_assets.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/utils/app_theme.dart';
import 'package:untitled/ui/utils/constants.dart';

import '../../../detial_screen/detials_screen.dart';

class AhadethTab extends StatelessWidget {
List<String> ahadethNames = List.generate(50, (index) {
  return " ${index + 1} الحديث رقم ";
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.ahadesTab)),
        Divider(
          thickness: 3,
          height: 3,
          color: AppColors.primary,
        ),
        Container(
            margin : EdgeInsets.all(6),
            child: Text("Hadeth Name",style: AppTheme.quarnTitleTextStyle,textAlign: TextAlign.center,)),
        Divider(
          thickness: 3,
          height: 3,
          color: AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: ahadethNames.length,
            itemBuilder: (_,index){
              return TextButton(onPressed: (){
                Navigator.pushNamed(context, DetailsScreen.routeName, arguments: DetailsScreenArgs(suraOrHadethName: ahadethNames[index], fileName: "h${index+1}.txt", isQuarn: false));

              },
                  child:Text(ahadethNames[index],textAlign: TextAlign.center,style: AppTheme.quarnTitleTextStyle.copyWith(fontWeight: FontWeight.normal),)
              );
            },
          ),

        )
      ],
    );
  }
}
