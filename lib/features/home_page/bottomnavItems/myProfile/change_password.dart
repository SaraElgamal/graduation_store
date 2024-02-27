import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../logic/cubit.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  var passwordRegister = TextEditingController();
  var verifyPassword = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(
          context: context,
          isReverse: true,
          title: S.of(context).resetPass),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Text(S.of(context).NewPassword,style:  GoogleFonts.tajawal(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ), ),

            SizedBox(height: 9.h),
            defaultTextFormFeild(

              context,
              onSubmit: (_){},
              secure: AppCubit.get(context).isPasswordSign,
              suffix: AppCubit.get(context).suffixSign,
              controller: passwordRegister,
              onpressed: (){
                AppCubit.get(context).suffixChangeSign();

              },
              keyboardType: TextInputType.text,

              validate: (value)
              {
                if (value == null || value == '') {
                  return S.of(context).validate;
                }
                if (value.length < 6) {
                  return S.of(context).condition_pass ;
                }
              },
              // hint: 'كلمة السر',
              label:S.of(context).pass,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(S.of(context).VerifyNewPassword,style:  GoogleFonts.tajawal(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ), ),

            SizedBox(height: 9.h),
            defaultTextFormFeild(
                controller: verifyPassword,
                secure: AppCubit.get(context).isPasswordVerify,
                suffix: AppCubit.get(context).suffixVerify,
                onpressed: (){
                  AppCubit.get(context).suffixChangeVerify();

                },
                keyboardType: TextInputType.text,
                validate: (value)
                {

                  if (value == null || value == '') return S.of(context).validate_password_verify;
                  if (value !=  passwordRegister.text || verifyPassword.text != passwordRegister.text) return S.of(context).validate_password_verify;

                },
                //   hint: S.of(context).password_verify,
                label: S.of(context).verify_pass,
                context
            ),



            SizedBox(height: 32.h),



            SizedBox(height: 59.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: MaterialButton(

                onPressed: ()
                {

                },
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 80.w),
                height: 48.h,
                minWidth: 100.w,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),

                color: SecondColor,
                child:  Center(
                  child: Row(
                    children: [
                      const  Icon(Icons.check,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Text(
                        S.of(context).ChangePasswordButton,
                        style:  GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
