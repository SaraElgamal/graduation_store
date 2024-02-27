import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/components/components.dart';
import '../../../core/constant/const/const.dart';
import '../../../generated/l10n.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';
import 'done.dart';


class VerificationPhoneAndEmail extends StatefulWidget {
  @override
  State<VerificationPhoneAndEmail> createState() => _VerificationPhoneAndEmailState();
}

class _VerificationPhoneAndEmailState extends State<VerificationPhoneAndEmail> {
  var formKey = GlobalKey<FormState>();
var verify1 = TextEditingController();
var verify2 = TextEditingController();
var verify3 = TextEditingController();
var verify4 = TextEditingController();
  late Timer resendTimer;
  int countdown = 120; // 2 minutes in seconds
  @override
  void initState() {
    super.initState();
    // Initialize the timer with a duration of 2 minutes
    resendTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel(); // Cancel the timer when countdown reaches 0
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is disposed
    resendTimer.cancel();
    super.dispose();
  }

  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return
      BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
if(state is PostSuccessVerifyState)
{
}
        },
        builder: (context, state) {

          String strDigits(int n) => n.toString().padLeft(2, '0');
          // final minutes = strDigits(cubit.myDuration.inMinutes.remainder(60));
          // final seconds = strDigits(cubit.myDuration.inSeconds.remainder(60));

          return
            Scaffold(
              appBar: appBarDefaultTheme
                (context: context, isReverse: true, title: S.of(context).verifyPhone),
              body: Form(
                key: formKey,
                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 18.w ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: 24.h,),
                       logo(),
                        SizedBox(height: 24.h,),
                        Text(S.of(context).verifyCode,style: GoogleFonts.cairo(fontSize: 20.sp,fontWeight: FontWeight.w600),),

                        SizedBox(height: 8.h, ),
                        Row(

                          children: [
                            Expanded(child: Center(child: Text(


                              S.of(context).pleaseEnterCoderContain,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: GoogleFonts.cairo(fontSize: 14.sp,color: Color(0xFF757171)),))),
                            // Image.asset('assets/images/Edit.png'),


                          ],
                        ),

                        SizedBox(height:20.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              verifyTextField(context,controller: verify1),
                              verifyTextField(context,controller: verify2),
                              verifyTextField(context,controller: verify3),
                              verifyTextField(context,controller: verify4),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     // Text(S.of(context).left_time,
                        //     //   style: GoogleFonts.cairo(fontSize: 14.sp,),),
                        //     // Text(
                        //     //   '$minutes:$seconds', style: cubit.font(fontSize: 14.sp,),),
                        //   ],
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Flexible(child: Text(S.of(context).QSend,style: GoogleFonts.cairo(fontSize: 12.0),)),
                            SizedBox(width: 5.h,),
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              ),
                              onPressed: () {
                                if(countdown == 0) {
                                  setState(() {
                                   // AppCubit.get(context).sendOTPUser();
                                    countdown = 120;
                                    resendTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
                                      if (countdown > 0) {
                                        setState(() {
                                          countdown--;
                                        });
                                      } else {
                                        timer.cancel(); // Cancel the timer when countdown reaches 0
                                      }
                                    });// Reset the countdown
                                  });
                                }
                              },
                              child: Text(
                                S.of(context).resendAgain,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.cairo(fontSize: 12.0, color: countdown > 0 ? Colors.grey : SecondColor),
                                maxLines: 2,
                              ),
                            ),

                            // TextButton(
                            //   style: TextButton.styleFrom(
                            //     alignment: Alignment.center,
                            //     padding:  const EdgeInsets.symmetric(horizontal: 0.0),
                            //   ),
                            //   onPressed:()
                            //   {
                            //
                            //     // if(seconds == '00') {
                            //     //   cubit.startTimer();
                            //     // }
                            //   },
                            //   child: Text(
                            //
                            //     S.of(context).resendAgain,
                            //     textAlign: TextAlign.left,
                            //     style: GoogleFonts.cairo(fontSize: 12.0,color:  SecondColor ),
                            //     maxLines: 2,),
                            // ),
                          ],
                        ),

                      countdown > 0 ?    Center(
                          child: Text(
                            formatTime(countdown),
                            style: TextStyle(fontSize: 16),
                          ),
                        ) : Container(),
                        SizedBox(height:20.h,),
                        defaultButton(context: context,text:S.of(context).verifyButton,
                            toPage: () {
                              if (formKey.currentState!.validate()) {
// AppCubit.get(context).verifyPoneByOTP(
//     phone: AppCubit.get(context).phoneReg.toString(),
//     otp: '${verify4.text}${verify3.text}${verify2.text}${verify1.text}');
print('${verify4.text}${verify3.text}${verify2.text}${verify1.text}');
navigateTo(context, const DoneVerify());

                              }
                            }
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ); },
      );
  }
}
