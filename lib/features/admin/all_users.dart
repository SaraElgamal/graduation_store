import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/auth/models/login_model.dart';
import 'package:graduation_project/features/logic/cubit.dart';
import 'package:graduation_project/features/logic/states.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/components/components.dart';
import '../../core/constant/const/const.dart';


class AllUsersScreen extends StatefulWidget {

  AllUsersScreen();

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  void initState() {
  AppCubit.get(context).AllUsersFun();
    // TODO: implement initState
    super.initState();
  }


  bool click = false;
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme
        (context: context, isReverse: true, title: 'جميع المستخدمين'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              if(state is GetLoadingAllUsersState)
              {
                Center(child: loader());
              }
            },
            builder: (context, state) {
              if (state is GetLoadingAllUsersState) {
                Center(child: loader());
              }

                return
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h,),
                      Text('جميع المستخدمين : ', style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                      SizedBox(height: 30.h,),
                      AppCubit
                          .get(context)
                          .allUsers != null || AppCubit
                          .get(context)
                          .allUsers!
                          .data!
                          .isNotEmpty ?
                      ListView.separated
                        (
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),

                                decoration: BoxDecoration(
                                  color:
                                  gridColor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),

                                    Row(
                                      children: [

                                        Text(' الاسم : ${AppCubit
                                            .get(context)
                                            .allUsers!
                                            .data![index].firstName} ${AppCubit
                                            .get(context)
                                            .allUsers!
                                            .data![index].lastName}  ',
                                          style: GoogleFonts.cairo(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),),

                                        Spacer(),
                                        BlocConsumer<AppCubit, AppStates>(
                                          listener: (context, state) {

                                          },
                                          builder: (context, state) =>
                                              InkWell(
                                                  onTap: () {
                                                    AppCubit.get(context)
                                                        .deleteUsersFun(
                                                      userId: AppCubit
                                                          .get(context)
                                                          .allUsers!
                                                          .data![index].id,
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.delete_forever,

                                                    size: 30,
                                                    color: Colors.red,)),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20.h,),

                                    Row(children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected = index;
                                            click = !click;
                                          });
                                        },
                                        child: Text(

                                            'عرض البيانات',
                                            style: GoogleFonts.cairo(
                                                decoration: TextDecoration
                                                    .underline,
                                                fontSize: 18.sp,
                                                color: SecondColor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const Icon(Icons.arrow_drop_down_outlined,
                                        color: SecondColor,),
                                      Text('( ${AppCubit
                                          .get(context)
                                          .allUsers!
                                          .data![index].role} )  ',
                                        style: GoogleFonts.cairo(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),),
                                    ],),
                                    SizedBox(height: 10.h,),
                                    click && selected == index
                                        ? listViewItemsCar(
                                        context, get: AppCubit
                                        .get(context)
                                        .allUsers!
                                        .data![index])
                                        : Container(),


                                    SizedBox(height: 20.h,),

                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                          const Divider(color: fillRectangular),
                          itemCount: AppCubit
                              .get(context)
                              .allUsers!
                              .data!
                              .length) :

                      Center(child: Column(
                        children: [

                          Lottie.asset(
                              'assets/animation/Animation - 1707786695011.json'),

                          Text(

                            'لا يوجد مستخدمين',
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),

                    ],
                  );

            }
          ),
        ),
      ),




    );
  }

  Widget listViewItemsCar(context, {required DataAllUsersInDetails get}) {



          return Stack(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 240.w,
                right: 8.w,
                top: 10.h,

                child: Container(
                  height: 112.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(

                      image: NetworkImage(

                        get.file!.toString(),
                      ),

                    ),

                  ),
                ),
              ),

              /// ///////////////
              Positioned(
                top: 16.h,
                right: 120.w,

                child: Text('البريد الالكتروني : ', style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),),

              ),
              Positioned(
                top: 50.h,

                right: 120.w,
                child: Text(get.email.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp, fontWeight: FontWeight.w500,),),
              ),
              Positioned(
                top: 90.h,
                right: 120.w,
                left: 131.w,
                child: Text('الهاتف : ', style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),),

              ),
              Positioned(
                top: 90.h,
                right: 190.w,

                child: Text(
    get.phone.toString(),
                  style: GoogleFonts.cairo(fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: SecondColor),),

              ),
              Positioned(
                top: 130.h,
                right: 120.w,

                child: Text('تم التسجيل : ', style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),),

              ),
              Positioned(
                top: 159.h,
                left: 5.w,
                child: Text(
                  '${get.createdAt}',
                  style: GoogleFonts.cairo(fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: SecondColor),),

              ),
/// ////////////////////////
            ],

          );

  }

}
