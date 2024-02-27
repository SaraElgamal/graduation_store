import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDot extends StatelessWidget {
  final int currentIndex;
  final int index;
  final Color color;
 // final PageController PageControl;
 // final int count;
  const CustomDot(
      {super.key,
        required this.currentIndex,
        required this.index,
        required this.color,
       // required this.PageControl,
       // required this.count,

      });

  @override
  Widget build(BuildContext context) {
     return
    // SmoothPageIndicator(controller: PageControl,
    //
    //     effect: const ExpandingDotsEffect(
    //
    //       dotColor: Colors.grey,
    //       activeDotColor: SecondColor ,
    //       expansionFactor: 3,
    //
    //       spacing: 5.0,
    //       dotHeight: 5.0,
    //       dotWidth: 10.0,
    //     ),
    //     count: count);

      Container(
      height: 4.h,
      width: 20.w,
      margin:  EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20.r),
        shape: BoxShape.rectangle,
        color: color,
      ),
    );
  }
}
