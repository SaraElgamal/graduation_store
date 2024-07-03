import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../features/home_page/home_page.dart';
import '../const/const.dart';
import '../const/transition.dart';
Future navigateFinish(
    BuildContext context,
    Widget widget,
    ) =>
    Navigator.of(context).pushReplacement(

      SliderRight(page: widget),

    );
Future navigateTo(
  BuildContext context,
  Widget widget,
) =>
    Navigator.of(context).push(

       SliderRight(page: widget),

        );

Widget defaultButton(
        {
          required BuildContext context,
        required String text,
        required Function() toPage}) =>
    MaterialButton(
      onPressed: toPage,
      padding: EdgeInsets.symmetric(vertical: 13.h),
      height: 48.h,
      minWidth: 172.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      color: SecondColor,
      child:  Text(
        text,
        style:  GoogleFonts.tajawal(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
      ),
    );

Widget buttonAddCard(
    {
      required BuildContext context,
      required String text,
      required String iconText,

      required Function() toPage}) =>
    MaterialButton(

      onPressed: toPage,
      padding: EdgeInsets.symmetric(vertical: 13.h,),
      height: 48.h,
      minWidth: 241.w,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      color: SecondColor,
      child:  Center(
        child: Row(
          children: [
            SvgPicture.asset(iconText,color: Colors.white,),
            SizedBox(width: 10.w,),
            Text(
              text,
              style:  GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

Widget defaultTextFormFeild(
  context, {
  required TextInputType keyboardType,
  required String? Function(String?) validate,
  String? hint,
  required String label,
  Widget? suffix,
  Function()? onpressed,
  bool secure = false,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
    TextEditingController?  controller,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      obscureText: secure,
      keyboardType: keyboardType,
      validator: validate,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 1),

        // constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 18 ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        border: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(14),
        ),
        suffixIcon: onpressed != null ?  IconButton(
          onPressed: onpressed ?? null ,
          icon: suffix!,
        ) : null ,


        hintText: hint,
        labelText: label,
   alignLabelWithHint: true,

        labelStyle: GoogleFonts.cairo(
         fontSize: 16.sp,
          color: const Color(0xff606F7B),

        ),
      ),
    );
Widget searchTextField({
  required Function(String)? search,
  required Function()? onTap ,
  required Function(PointerDownEvent)? onTapOutside ,
  required Function(String?)? onSaved ,
  required BuildContext context,
}) =>  TextFormField(

  onChanged:  search,
  onTap: onTap,
  onTapOutside: onTapOutside,
  onSaved: onSaved ,
  decoration: InputDecoration(
    filled: true,

    fillColor: fillRectangular,
    labelText: 'بحث',

    labelStyle: GoogleFonts.tajawal(

      fontSize: 16.sp,

      color: const Color(0xff606F7B),
    ),

    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: fillRectangular)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(

            color: fillRectangular),

        borderRadius: BorderRadius.circular(8)),

    contentPadding: EdgeInsets.symmetric(horizontal: 26.w),

    prefixIconConstraints: const BoxConstraints(
      minHeight: 24,
      minWidth: 24,
    ),

    suffixIconConstraints: const BoxConstraints(
      minHeight: 24,
      minWidth: 24,
    ),
    suffixIcon: Padding(
      padding:  EdgeInsets.only(left: 16.0.w),
      child: InkWell(
          onTap: ()
          {

        // navigateTo(context, Test());
          },
          child: SvgPicture.asset('assets/images/lets-icons_filter.svg')),
    ),
    prefixIcon: Padding(
      padding:  EdgeInsets.only(right: 16.0.w, left: 16.0.w),
      child: SvgPicture.asset(


          'assets/images/material-symbols-light_search.svg'),
    ), ///temporary

  ), );

Widget searchBarField({

  required BuildContext context,
}) =>  TextFormField(

onTap: ()
{
  SchedulerBinding.instance.addPostFrameCallback((_) {
   // navigateTo(context,  SearchDetails());

  });
},
  decoration: InputDecoration(
    filled: true,

    labelText: 'ابحث',


    labelStyle: GoogleFonts.tajawal(

      fontSize: 16.sp,

      color: const Color(0xff606F7B),
    ),

    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: fillRectangular)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(

            color: Colors.deepOrange),

        borderRadius: BorderRadius.circular(8)),

    contentPadding: EdgeInsets.symmetric(horizontal: 26.w),

    prefixIconConstraints: const BoxConstraints(
      minHeight: 24,
      minWidth: 24,
    ),

    suffixIconConstraints: const BoxConstraints(
      minHeight: 24,
      minWidth: 24,
    ),
    //suffixIcon: Container(),
    prefixIcon: Padding(
      padding:  EdgeInsets.only(right: 16.0.w, left: 16.0.w),
      child: SvgPicture.asset(


          'assets/images/search.svg'),
    ), ///temporary

  ), );
Widget verifyTextField(context,{required TextEditingController? controller}) => Container(
  height: 53.h,
  width: 51.w,
  padding: EdgeInsets.symmetric( horizontal: 10.w, vertical: 0.h ),
  decoration: BoxDecoration(

      border: Border.all(color:  Colors.grey ),
      borderRadius: BorderRadius.circular(6)),
  child: TextFormField(

controller: controller,

    validator: (value) {
      if (value == null || value == '') return '';
      return null;
    },
    onChanged: (value) {
      if (value.length == 1) {
       // if (AppCubit.get(context).isArabicSelected) {
          FocusScope.of(context).previousFocus();
        // } else {
        //   FocusScope.of(context).nextFocus();
        //}
      }
    },
    textAlign: TextAlign.center,
    decoration: const InputDecoration(

      helperText: '',
      helperStyle: TextStyle(fontSize: 3,),
      errorStyle: TextStyle(fontSize: 3,),



      border: UnderlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly,
    ],
  ),
);

Widget logo() => Image.asset('assets/images/logo_dark 1.png',height: 100.h,width: 100.w,fit: BoxFit.contain,);
PreferredSizeWidget appBarDefaultTheme({
  required BuildContext context,
  required bool isReverse  ,
  required String title,
  List<Widget>? actions,
}) => AppBar(
  elevation: 5.0,
  centerTitle: true,
  titleTextStyle: GoogleFonts.tajawal(

    fontSize: 16.sp,
fontWeight: FontWeight.bold,
    color:  Colors.black,
  ),

  backgroundColor: Colors.white,
  leading: isReverse  ? IconButton(
    icon:
       const Icon(Icons.arrow_back_ios,color: Colors.black,),
    onPressed: (){
      Navigator.pop(context);
     // ClinicCubit.get(context).clearData();
    },
  ) : Container(),
  title: Text(title!),
  actions: actions,

);
Widget defaultButtonSmall(
    {
      required BuildContext context,
      required String text,
      required double width,
      required double height,
      required double textSize,

      required Function() toPage}) =>
    MaterialButton(
      onPressed: toPage,
      //padding: EdgeInsets.symmetric(vertical: 13.h),
      height: 24.h,
      minWidth: width,

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(30.r),
      ),

      // color: primaryColor3,
      child:  Container(
        height: height,
        width: width,

        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.cairo(fontSize:  textSize  ,fontWeight: FontWeight.w700
                ,color: Colors.white),
          ),
        ),


      ),

    );

Widget loader() =>  Container(
  height: 200.h,
  color: Colors.pinkAccent.shade100.withOpacity(0.1),
  child:   Center(

    child: Image.asset('assets/images/final-aanimi-logo.gif',
  height: 120.h,
      width: 120.h,
    ),
  ),
);

Widget notFound() => Center(
  child: Lottie.asset('assets/animation/Animation - 1706096646711.json',height: 230.h.h,width: 230.w.w),);

Widget nothing(
{
  required String text,
}) =>  Column(

  children: [
    SizedBox(height: 150.h,),
    notFound(),
    SizedBox(height: 30.h,),
    Text(text,style: GoogleFonts.cairo(fontSize: 20.sp,fontWeight: FontWeight.bold)),


  ],
);