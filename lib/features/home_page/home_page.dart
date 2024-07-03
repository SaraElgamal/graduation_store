import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/const/const.dart';
import '../../generated/l10n.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) =>  Scaffold(
        backgroundColor: Colors.white,
        body: cubit.screens[cubit.currentIndex] ,
        bottomNavigationBar:  BottomNavigationBar(
          elevation: 0.0,

          unselectedItemColor: const Color(0xFF9B9B9B) ,
          unselectedLabelStyle:  GoogleFonts.cairo(
            color: const Color(0xFF9B9B9B),

          ),
          unselectedIconTheme: const IconThemeData(color: Color(0xFF9B9B9B)),
          selectedIconTheme: const IconThemeData(color: SecondColor,),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: SecondColor,

          selectedLabelStyle: GoogleFonts.cairo(
            color: SecondColor,

          ),
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomIndex(index);
          },
          items:  [

            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/Favorite .svg'
              ,
              height: 30.0.h,
              width: 30.0.w,
              color:cubit.currentIndex == 0 ? SecondColor : const Color(0xFF9B9B9B),
            ),
              label: S.of(context).favorite,
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/Group (3).svg'
              ,
              height: 30.0.h,
              width: 30.0.w,
              color :   cubit.currentIndex == 1 ? SecondColor : const Color(0xFF9B9B9B),
            ),
              label: S.of(context).category,
            ),
            // BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/shopping.svg'
            //   ,
            //   height: 30.0.h,
            //   width: 30.0.w,
            //   color: cubit.currentIndex == 2 ? SecondColor : const Color(0xFF9B9B9B),
            // ),
            //   label: 'العربة',
            // ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/user.svg'
              ,
              height: 30.0.h,
              width: 30.0.w,
              color: cubit.currentIndex == 2 ? SecondColor : const Color(0xFF9B9B9B),
            ),
              label: S.of(context).profile,
            ),
          ],
        ),
      ),
    );
  }
}
