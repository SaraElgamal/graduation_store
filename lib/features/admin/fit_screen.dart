import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/components/components.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';
import 'package:graduation_project/features/admin/web_photo.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/constant/const/const.dart';


class FitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cat  = CardCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: gridColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: SizedBox(
              height: 60.h,
              width: 60.w,
              child: SvgPicture.asset('assets/images/logo.svg',)), centerTitle: true,),
        body: BlocConsumer<CardCubit,ShoppingStates>(
          listener: (context, state) {
if(state is SuccessProcessing || CardCubit.get(context).imageFinallyUrl != null)
{
  navigateTo(context, PhotoViewApp(CardCubit.get(context).imageFinallyUrl.toString()));
}}, builder: (context, state) =>
Column(children: [
    SizedBox(height: 100.h,),
  Center(
    child: Lottie.asset(
        'assets/animation/Animation - 1719947179925.json',
fit: BoxFit.cover,
    height: 200.h,
      width: 250.w
    ),
  ),
SizedBox(height: 130.h,),
  Text('...LOADING', style: TextStyle(color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 25.sp),),
],),
        ),

      ),
    );
  }
}
