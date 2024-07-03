import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/home_page/home_page.dart';
import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../logic/cubit.dart';
import '../../../logic/states.dart';
import '../../login/presentation/login.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

var nameF = TextEditingController();
var nameL = TextEditingController();

var email = TextEditingController();

var phone = TextEditingController();
class _RegisterScreenState extends State<RegisterScreen> {
var formKey = GlobalKey<FormState>();



bool chooseRole = true ;
  var message = TextEditingController();

  var passwordRegister = TextEditingController();
  var verifyPassword = TextEditingController();

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
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
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
                            child: Text(S.of(context).enjoy_with_us,style:  GoogleFonts.cairo(
                              color: fillRectangular,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ), ),
                          ),
                          SizedBox(
                            height: 40.78.h,
                          ),

                          Text('الاسم الاول',
                            style:  GoogleFonts.tajawal(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ), ),
                          SizedBox(
                            height: 10.h,
                          ),
                          defaultTextFormFeild(
                            context,
                            controller: nameF,
                            validate: (value) {
                              if (value == null || value == '') {
                                return S.of(context).validate;
                              }
                            },
                            label: 'الاسم الاول',
                            // hint: 'الاسم الاول',
                            keyboardType: TextInputType.name,
                            suffix: Container(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('الاسم الاخير',
                            style:  GoogleFonts.tajawal(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ), ),

                          SizedBox(
                            height: 10.h,
                          ),
                          defaultTextFormFeild(
                            context,
                            controller: nameL,
                            validate: (value) {
                              if (value == null || value == '') {
                                return S.of(context).validate;
                              }
                            },
                            label: 'الاسم الاخير',
                            // hint: 'الاسم الاول',
                            keyboardType: TextInputType.name,
                            suffix: Container(),
                          ),
                          SizedBox(height: 24.h),
                          Text(S.of(context).email ,style:  GoogleFonts.tajawal(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ), ),
                          SizedBox(
                            height: 10.h,
                          ),

                          defaultTextFormFeild(
                            context,
                            suffix: Container(),
                            controller: email,
                            validate: (value) {
                              if (value == null || value == '') {
                                return S.of(context).validate;
                              }
                              if (!value.contains('@')) {
                                return S.of(context).condition_email;
                              }
                            },
                            label: S.of(context).email,
                            // hint: 'البريد الالكتروني',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [

                              InkWell(
                                onTap: ()
                                {
                                  setState(() {

                                    chooseRole = true ;
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 23.h,
                                      width: 23.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(color:  Colors.black,width: 3),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration:  BoxDecoration(
                                        color: chooseRole ? Colors.blue : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text('مستخدم',style : GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w600)),
                              SizedBox(width: 30.w,),

                              InkWell(
                                onTap: ()
                                {
                                  setState(() {
                                    chooseRole = false ;
                                  });

                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 23.h,
                                      width: 23.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(color:  Colors.black,width: 3),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration:  BoxDecoration(
                                        color: chooseRole ? Colors.white  : Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text('صاحب محل',style : GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w600)),

                            ],
                          ),

                          SizedBox(height: 24.h),
                          Text(S.of(context).mobile_number,style:  GoogleFonts.tajawal(
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
                            controller: phone,
                            label: S.of(context).mobile_number_text,
                            // hint: 'رقم التيلفون',
                            keyboardType: TextInputType.phone,
                            suffix: Container(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(S.of(context).pass,style:  GoogleFonts.tajawal(
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
                          Text(S.of(context).verify_pass,style:  GoogleFonts.tajawal(
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
    BlocConsumer<AppCubit,AppStates>(
    listener: (context, state) {
if(state is PostSuccessRegisterState)
{
  navigateTo(context, HomePage());

}
    },
    builder: (context, state) {
      if (state is PostLoadingRegisterState) {
        return loader();
      }
      else {
        return
          Center(
            child: defaultButton(
                context: context,
                text: S
                    .of(context)
                    .login,
                toPage: () {
                  if (formKey.currentState!.validate()) {
                    AppCubit.get(context).postRegister(
                      firstName: nameF.text,
                      lastName: nameL.text,
                      email: email.text,
                      role: chooseRole ? "user" : "Products Owner",
                      phone: phone.text,
                      password: passwordRegister.text,
                    );
                  }
                }

            ),
          );
      }
    }
    ),


                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: S.of(context).have_account,
                                      style: GoogleFonts.tajawal(
                                        color: const Color(0xff606F7B),
                                        fontSize: 16.0.sp,


                                        // height: 1.3,
                                      ),
                                    ),


                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 2.w,),
                              TextButton(

                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0.0),
                                ),
                                onPressed: (){},
                                child: TextButton(
                                  onPressed:()
                                  {

                                    navigateTo(context,  LoginScreen() );

                                  },
                                  child: Text(S.of(context).login,

                                    style: GoogleFonts.tajawal(
                                      decoration: TextDecoration.underline,

                                      color: primaryColor,
                                      fontSize: 16.0.sp,

                                      fontWeight: FontWeight.w400,
                                      //  height: 1.3,
                                    ), ),),),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
