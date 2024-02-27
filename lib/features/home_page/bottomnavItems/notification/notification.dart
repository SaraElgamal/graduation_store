import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appBarDefaultTheme(
           context: context, isReverse: true, title: S.of(context).notify),

    body: notify(),



    );
  }

  Widget noNotifications(context) => Column(
    children: [
      SizedBox(height: 150.h,),
      Center(
        child: Lottie.asset('assets/animation/Animation - 1706444658568.json',),),
      SizedBox(height: 30.h,),
      Text(S.of(context).noNotify,style: GoogleFonts.cairo(fontSize: 20.sp,fontWeight: FontWeight.bold)),

    ],
  );
  Widget notify () =>  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: gridColor,
              ),
            ),
            Positioned(
              left: 240.w,
              right: 8.w,
              top: 20.h,

              child: const CircleAvatar(
                radius: 30.0,

                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),



            Positioned(
              top: 16.h,
              right: 126.w,
              left: 5.w,
              child: Text('تم توفير هذا المنتج مرة آخرى.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            ),

            Positioned(
              top: 50.h,
              right: 126.w,
              left: 5.w,
              child:  Text(
                'عطر رجالي',style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w700,color: fillRectangular),),

            ),

            Positioned(
              top: 50.h,

              left: 5.w,
              child : Text(' pm 10.00 ',style: GoogleFonts.cairo(color: fillRectangular),),
            ),




          ],

        ),
      ],
    ),
  );
  Widget notification() =>
      Padding(

        padding:  EdgeInsets.symmetric(horizontal: 20.w),
  child:   SingleChildScrollView(
    physics: const  BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h,),

        Text('اليوم : ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w700),),
        SizedBox(height: 20.h,),
        notify(),
        SizedBox(height: 20.h,),
        notify(),
        SizedBox(height: 20.h,),

        Text('الاربعاء : ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w700),),
        SizedBox(height: 20.h,),
        notify(),
        SizedBox(height: 20.h,),
        notify(),
      ],
    ),
  ),
);
}
