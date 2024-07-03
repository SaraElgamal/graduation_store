
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/auth/login/presentation/login.dart';
import 'package:graduation_project/features/logic/cubit.dart';
import 'package:graduation_project/features/logic/states.dart';
import 'package:graduation_project/styles/styles.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../core/constant/end_points/end_point.dart';
import '../../../../generated/l10n.dart';
import '../../../update_profile/update_profile_logic/update_profile_cubit.dart';
import '../../../update_profile/update_profile_logic/update_profile_state.dart';
import 'curved.dart';
import 'edit_profile.dart';


class MyProfile extends StatefulWidget {

bool isReverse ;
MyProfile({required this.isReverse});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    if(token != null ) {
      AppCubit.get(context).updateMeFun();
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context, isReverse: widget.isReverse, title: 'حسابي'),
      body:

      token  != null ?     SingleChildScrollView(

        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is GetLoadingUpdateMeState ) {

              return Center(child: loader());
            }
            return
              Column(
                children: [
                  SizedBox(
                    height: 330.h,
                    child: Stack(

                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: ClipPath(
                            clipper: CurvedClipper(),
                            child: Container(
                              height: 250.0,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,

                              color: Colors.purpleAccent.shade100.withOpacity(
                                  0.2),

                            ),

                          ),
                        ),

                        Positioned(
                          top: 160.h,

                          child:  CircleAvatar(
                            radius: 70.0,
                            // here to get this image picker
                            backgroundImage: NetworkImage
                              (
                                cubit.updateData!.data!.file.toString()
                                ),

                          ),
                        ),


                      ],
                    ),


                  ),

                  Text( '${cubit.updateData!.data!.firstName.toString()} ${cubit.updateData!.data!.lastName.toString() }',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.w700),),


                  SizedBox(height: 25.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: gridColor,
                            offset: Offset(5, 5),
                          ),
                        ],
                        //  border: Border.all(color: SecondColor,width: 3),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 25.h),
                          Row(
                            children: [
                              Text('رقم الهاتف',style: Styles.style16SemiBold,),
                              const Spacer(),

                              Text(cubit.updateData!.data!.phone.toString(),style: Styles.style14whiteSemiBold,),

                            ],
                          ),

          Row(
            children: [
              Text('البريد الالكتروني',style: Styles.style16SemiBold,),
              const Spacer(),

              Text(cubit.updateData!.data!.email.toString(),
                style: Styles.style14whiteSemiBold,),

            ],
          ),
                        ],
                      ),
                    ),
                  ),

                  TextButton(
                    child: Text(S
                        .of(context)
                        .edit_profile),
                    onPressed: () {
                      navigateTo(context, EditProfile());
                    },


                  ),

                ],
              );
          }
        ),
      ) : Scaffold(
          body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ليس لديك حساب قم بتسجيل دخولك',style: Styles.style16SemiBold,),
                SizedBox(height: 20.h,),
                defaultButton(
                    context: context, text: 'تسجيل الدخول', toPage: ()
                {
                  navigateFinish(context, LoginScreen());
                },),

              ],
            ),
          ) ,


      ),






    );
  }
}
