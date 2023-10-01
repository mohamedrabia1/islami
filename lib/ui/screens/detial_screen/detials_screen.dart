import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/details_screen_args.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
 late DetailsScreenArgs Arguments;

  String fileContect = "";

  @override
  Widget build(BuildContext context) {
    Arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContect.isEmpty) raedFile();
    return
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.backGround),fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar:
          AppBar(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            centerTitle: true,
            title:
            Text(Arguments.suraOrHadethName,style: AppTheme.appBarTitleTextStyle),
          ),
          body: fileContect.isEmpty ? const Center(child:CircularProgressIndicator()) :
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                  borderRadius: BorderRadius.circular(20)
              ),
              height: MediaQuery.of(context).size.height * .9,
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(fileContect,textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 24, color: AppColors.accent),textAlign: TextAlign.center,),
                  )),
            ),
          ),

        ),
      );
  }

  void raedFile() async{
   String file = await rootBundle.loadString(Arguments.isQuarn ?
   "assets/files/quarn/${Arguments.fileName}" : "assets/files/ahadeth/${Arguments.fileName}");
   fileContect = file;

   List<String> fileLines = file.split("\n");
   for(int i = 0 ; i < fileLines.length ; i++){
     fileLines[i] += Arguments.isQuarn ? "(${i+1})" : " ";
   }
   fileContect =  fileLines.join();
   setState(() {});
  }
}
