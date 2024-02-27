import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/components/components.dart';
import '../../../core/constant/const/const.dart';
import '../../home_page/home_page.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
   body: Padding(
       padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
       child: Column(
         children: [
           SizedBox(height: 50.h,),
Center(
  child: Text('شكرا لك !',style: GoogleFonts.cairo(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700
  ),),
),
           SizedBox(height: 30.h,),
  Center(
    child: Text('تم استلام طلبك بنجاح.',style: GoogleFonts.cairo(

    ),),
),
           Lottie.asset('assets/animation/Animation - 1707171614249.json'),


     MaterialButton(
       onPressed: ()
       {
         navigateFinish(context, const HomePage());

       },
       padding: EdgeInsets.symmetric(vertical: 13.h),
       height: 48.h,
       minWidth: 300.w,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),

       color: SecondColor,
       child:  Text(
         'العودة للصفحة الرئيسية',
         style:  GoogleFonts.tajawal(
             color: Colors.white,
             fontSize: 16.sp,
             fontWeight: FontWeight.bold),
       ),
     ),
            ],
       ),
   ),
      ),
    );
  }
}
