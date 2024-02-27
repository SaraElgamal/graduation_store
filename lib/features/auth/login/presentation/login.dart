import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../home_page/home_page.dart';
import '../../../logic/cubit.dart';
import '../../../logic/states.dart';
import '../../register/presentation/register.dart';

var phoneLogin = TextEditingController();

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();




  var passwordLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  var call = AppCubit.get(context);

    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: SingleChildScrollView(
              child: BlocBuilder<AppCubit,AppStates>(
                builder:  (context, state) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Center(child: SvgPicture.asset(
                            'assets/images/logo.svg',
                        width: 100.w,
                          height: 120.5.h,
                          fit: BoxFit.fitWidth,
                        )),

                        Center(
                          child: Text(S.of(context).hello_to_youin,style:  GoogleFonts.cairo(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ), ),
                        ),

                        Center(
                          child: Text(S.of(context).login_to_store,style:  GoogleFonts.cairo(
                            color: fillRectangular,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ), ),
                        ),
                        SizedBox(
                          height: 40.78.h,
                        ),
                        Text(S.of(context).mobile_number,style:  GoogleFonts.cairo(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ), ),
                        SizedBox(
                          height: 10.h,
                        ),
                        defaultTextFormFeild(
                          context,

                          validate: (value) {
                            if (value == null || value == '') {
                              return S.of(context).validate;
                            }
                            if (value.length < 11 ) {
                              return S.of(context).condition_phone;
                            }
                          },
                          controller: phoneLogin,
                          label: S.of(context).mobile_number_text,

                          // hint: 'رقم التيلفون',
                          keyboardType: TextInputType.phone,
                          suffix: Container(),
                        ),
                        SizedBox(height: 24.h),
                        Text(S.of(context).pass,style:  GoogleFonts.cairo(
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
                          controller: passwordLogin,
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
                          label: S.of(context).pass,
                        ),
                     // InkWell(
                     //     onTap: ()
                     //     {
                     //       navigateTo(context,  ForgetPassword());
                     //     },
                     //     child: Text('هل نسيت كلمة المرور؟',style: GoogleFonts.cairo(decoration: TextDecoration.underline),)),

                        SizedBox(height: 32.h),
                        BlocConsumer<AppCubit,AppStates>(
                          listener: (context, state) {
// if(state is PostSuccessVerifyLoginState) {
//     navigateTo(context,  VerificationPhoneAndEmail());
// }
if(state is PostSuccessLoginState) {

}
                          },
                          builder: (context, state) {
    if(state is PostLoadingLoginState) {
    return loader();
    }
   else {
     return

       Center(
    child: defaultButton(
    context: context,
    text: S.of(context).login,
    toPage: () {
    if (formKey.currentState!.validate()) {
      navigateFinish(context, const HomePage());
    // AppCubit.get(context).postLogin(
    // phone : phoneLogin.text,
    // password : passwordLogin.text,
    // );
    // AppCubit.get(context).sendOTPUser(
    //   phone : phoneLogin.text,
    // );

     }


    }

    ),
    );
    }
                          }
                        ),


                        SizedBox(height: 14.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: S.of(context).dont_have,
                                    style: GoogleFonts.cairo(
                                      color: const Color(0xff606F7B),
                                      fontSize: 16.0.sp,


                                      // height: 1.3,
                                    ),
                                  ),


                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(width:1.w,),
                            TextButton(

                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                              ),
                              onPressed: (){},
                              child: TextButton(
                                onPressed:()
                                {

                                  navigateTo(context,  RegisterScreen() );

                                },
                                child: Text(

                                  S.of(context).register,

                                  style: GoogleFonts.cairo(
                                    decoration: TextDecoration.underline,
                                    color: primaryColor,
                                    fontSize: 16.0.sp,

                                    fontWeight: FontWeight.w600,
                                    //  height: 1.3,
                                  ), ),),),
                          ],
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
