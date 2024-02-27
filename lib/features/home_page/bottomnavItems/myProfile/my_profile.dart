import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
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

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context, isReverse: widget.isReverse, title: 'حسابي'),
      body:

          SingleChildScrollView(
            child: BlocConsumer<ProfileUserCubit,ProfileUserProfileState>(
              listener: (context, state) {

              },
              builder: (context, state) => Column(
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
                  child:  Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,

                  color: Colors.purpleAccent.shade100.withOpacity(0.2),

                  ),

                  ),
                  ),

                   Positioned(
                  top: 160.h,

                  child:  CircleAvatar(
                  radius: 70.0,
// here to get this image picker
                    backgroundImage: NetworkImage
                      ('https://cdn-icons-png.flaticon.com/512/3177/3177440.png'),

                  ),
                  ),




                  ],
                  ),


                  ),

                  Text('sara elgamal',style: GoogleFonts.cairo(fontWeight: FontWeight.w700),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('01254658874',style: GoogleFonts.cairo(fontWeight: FontWeight.w700)),
SizedBox(width : 10.w),
                      Container(height: 30.h,width: 1.w,color: Colors.black,),

                      SizedBox(width : 10.w),
                      Text('sara@gmail.com',style: GoogleFonts.cairo(fontWeight: FontWeight.w700)),
                    ],
                  ),

                  SizedBox(height : 33.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 130.h,
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
                  child:  Column(
                    children: [
                      Row(
                        children: [
                          Text(S.of(context).gender),
                        const  Spacer(),

                  Text('أنثى') ,

                        ],
                      ),

                      Row(
                        children: [
                          Text(S.of(context).dateRegister),
                      const    Spacer(),
                          Flexible(
                            child: Text(

                             '22 jan',
                              maxLines: 2, overflow: TextOverflow.ellipsis,),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

                  TextButton(
                    child:  Text(S.of(context).edit_profile),
                    onPressed: ()
                    {
                      navigateTo(context,  EditProfile());
                    },


                  ),

                ],
              ),
            ),
          ),






    );
  }
}
