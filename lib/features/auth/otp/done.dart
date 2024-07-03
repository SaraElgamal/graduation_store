// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../core/constant/components/components.dart';
// import '../../../core/constant/const/const.dart';
// import '../../../core/data_base/cache_helper/cache_helper.dart';
// import '../../../generated/l10n.dart';
// import '../../home_page/home_page.dart';
//
// class DoneVerify extends StatelessWidget {
//   const DoneVerify({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
//         child: Column(
//           children: [
//           SizedBox(height: 24.h,),
//         logo(),
//         SizedBox(height: 20.h,),
//             SizedBox(height: 20.h,),
//         Lottie.asset('assets/animation/Animation - 1706443737173.json'),
//
//             SizedBox(height: 30.h,),
//
//             Row(
//
//         children: [
//         Expanded(child: Center(child: Text(
//
//         // cubit.phonePressedSignUp ?
//         // '${S.of(context).we_send_code} 0xxxxxxxxxxx'
//         //     :
//         S.of(context).verifyDoneSuccess ,
//         textAlign: TextAlign.center,
//         maxLines: 2,
//         style: GoogleFonts.cairo(fontSize: 14.sp,color: const  Color(0xFF757171)),))),
//     // Image.asset('assets/images/Edit.png'),
//
//
//     ],
//     ),
//             SizedBox(height: 30.h,),
//             defaultButton
//               (context: context, text: S.of(context).EnterToHome,
//                 toPage:(){
//
//                   idUser = CacheHelper.getData(key: 'idUser');
//                   nameUser = CacheHelper.getData(key: 'nameUser');
//                   phoneUser = CacheHelper.getData(key: 'phoneUser');
//                   emailUser = CacheHelper.getData(key: 'emailUser');
//                   dateUser = CacheHelper.getData(key: 'dateUser');
//                   imageUser = CacheHelper.getData(key: 'imageUser');
//                   print(idUser);
//                   print(nameUser);
//                   print(phoneUser);
//                   print(emailUser);
//                   print(dateUser);
//                   print(imageUser);
//                  navigateTo(context, const HomePage()) ;
//                 },
//             ),
//
//     ],
//         ),
//       ),
//     );
//   }
// }
