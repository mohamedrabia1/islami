import 'package:flutter/material.dart';
import 'package:untitled/ui/utils/app_colors.dart';



class SebhaTab extends StatefulWidget {
  @override
  _SebhaTab createState() => _SebhaTab();
}

class _SebhaTab extends State
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int count = 0;
  int zikrIndex = 0;
  List<String> adhkar = [
    'سبحان الله',
    'الحمد الله',
    'الله اكبر',
    'استغفر الله',
    'لا اله الا الله',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: .03).animate(_animationController);
  }

  void incrementCount() {
    setState(() {
      count++;
      if (count % 33 == 1) {
        count = 1;
        zikrIndex = (zikrIndex + 1) % adhkar.length;
      }
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: incrementCount,
                    child: RotationTransition(
                      turns: _animation,
                      child: Image.asset(
                        'assets/images/sebha.png',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      Text(
                        'عدد التسبيحات',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.primary,
                            borderRadius: BorderRadius.circular(14)

                        ),
                        child: Center(
                          child: Text(
                            '$count',
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: AppColors.white,),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 44,
                        width: 92,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(18)
                      ),
                        child : Center(
                          child: Text(
                            '${adhkar[zikrIndex]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0,color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
  }
}