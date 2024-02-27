// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../core/constant/components/components.dart';
// import '../../../../core/constant/const/const.dart';
// import '../../../../generated/l10n.dart';
// import '../../../categories/all_cat/all_cat_model.dart';
// import '../../Products/logic/cubit.dart';
// import '../../Products/logic/states.dart';
//
// class ProductOfSub extends StatelessWidget {
//   final int list ;
//   final int subCat ;
//     ProductOfSub({required this.list, required this.subCat});
//
//   @override
//   Widget build(BuildContext context) {
//     var sub = ProductsCubit.get(context);
//     return BlocConsumer<ProductsCubit,ProductStates>(
//
//       listener: (context, state) {
//
//       },
//       builder: (context, state) =>  ConditionalBuilder(
//         condition: true,
//         builder: (context) =>  SafeArea(
//           child: Scaffold(
//             appBar: appBarDefaultTheme(
//
//                 context: context, isReverse: true, title: ''),
//             backgroundColor: gridColor,
//             body: Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 20.w),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     Row(
//                       children: [
//                         Text(S.of(context).main,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
//                         SizedBox(
//                           width: 6.h,
//                         ),
//                         Container(
//                           height: 20.h,
//                           width: 1.w,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 6.h,
//                         ),
//                         Text('قميص مستورد ذو خامة ممتازة',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
//                         SizedBox(
//                           width: 6.h,
//                         ),
//                        Container(
//                          height: 20.h,
//                          width: 1.w,
//                          color: primaryColor,
//                        ),
//                         SizedBox(
//                           width: 6.h,
//                         ),
//                         Text('تيشرت بولو قطن بأكمام قصيرة وشعار امامي بأطراف مضلعة للرجال من موباكو',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
//
//
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       separatorBuilder: (context, index) => const Divider(),
//                       itemBuilder: (context, index) => InkWell(
//                           onTap: ()
//                           {
//                             navigateTo(context, AllCategoryDetailedScreen(
//                                 categoryId: sub.all_cat![list].subcategories![subCat].products![index].category_id
//                                 ,subId: sub.all_cat![list].subcategories![subCat].products![index].subcategory_id
//                                 ,name: sub.all_cat![list].subcategories![subCat].products![index].name,
//                             productId: sub.all_cat![list].subcategories![subCat].products![index].id.toString(),
//                             ));
//                           },
//                           child: listViewItemsSub(sub.all_cat![list],index,context)),
//                       itemCount: sub.all_cat![list].subcategories![subCat].products!.length,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//         fallback: (context) => Scaffold(
//             backgroundColor:  Colors.pinkAccent.shade100.withOpacity(0.5),
//             body: Center(child: loader())),
//       ),
//     );
//   }
//
//   bool isFav = false ;
//   Widget listViewItemsSub (DataAllCategory data, int i,context) =>  Stack(
//         children: [
//           Container(
//             height: 120.h,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Colors.white,
//             ),
//           ),
//           Positioned(
//             left: 240.w,
//             right: 8.w,
//             top: 2.h,
//
//             child: Container(
//               height: 112.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 image: DecorationImage(
//
//                   image: NetworkImage(
//
//                     data.subcategories![subCat].products![i].image.toString(),
//                   ),
//
//                 ),
//
//               ),
//             ),
//           ),
//           // Positioned(
//           //   top: 5.0.h,
//           //   right: 5.0.w,
//           //
//           //   child:  InkWell(
//           //     onTap: ()
//           //     {
//           //       // setState(() {
//           //       //   isFav = ! isFav ;
//           //       // });
//           //     },
//           //     child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
//           //   ),),
//           Positioned(
//             top: 16.h,
//             right: 120.w,
//             left: 5.w,
//             child: Text(data.subcategories![subCat].products![i].name.toString(),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
//           ),
//           Positioned(
//             top: 70.h,
//             right: 120.w,
//             left: 131.w,
//             child:  Text(S.of(context).thePriceInDetail,style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700),),
//
//           ),
//           Positioned(
//             top: 70.h,
//             right: 170.w,
//             left: 5.w,
//             child:  Text('${data.subcategories![subCat].products![i].price.toString()} ر.س  ',style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700,color: SecondColor),),
//
//           ),
// //           Positioned(
// //             top: 70.h,
// //             left: 20.w,
// // child : SvgPicture.asset('assets/images/add_car.svg'),
// //           ),
//
//
//
//
//         ],
//
//   );
//
// }
