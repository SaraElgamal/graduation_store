// import 'dart:developer';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:youin/core/constant/components/components.dart';
// import 'package:youin/core/utils/toast.dart';
// import 'package:youin/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
// import 'package:youin/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';
// import 'package:youin/features/home_page/Products/logic/cubit.dart';
// import 'package:youin/features/home_page/Products/logic/states.dart';
//
// import '../../core/constant/const/const.dart';
// import '../../generated/l10n.dart';
// import '../ShoppingCar/shopping_car.dart';
// import '../logic/cubit.dart';
// import '../logic/states.dart';
// import '../rating/RateModel/rate_model.dart';
// import '../rating/custom_rating.dart';
// import '../rating/rate_logic/rate_cubit.dart';
// import '../rating/rate_logic/rate_states.dart';
// import '../rating/rating_screen.dart';
//
// class CustomScreen extends StatefulWidget {
//
//   final int index ;
//   final  cubit ;
//   final  bloc ;
//   final  state ;
//   CustomScreen({
//     required this.index,
//     required this.cubit,
//     required this.bloc,
//     required this.state,
//   });
//   @override
//   State<CustomScreen> createState() => _CustomScreenState();
// }
//
// class _CustomScreenState extends State<CustomScreen> {
//   int mountProduct = 1;
//   bool isFav = false;
//   bool showFullText = false;
//   int _currentImageIndex = 0; // Track the current image index for the small slider
//   late CarouselController _mainSliderController;
//   bool isClick = false;
//   double calculateTheNewPrice(double originalPrice, double discountAmount) {
//     return originalPrice - discountAmount;
//   }
//   @override
//   void initState() {
//     RateCubit.get(context).getRate(productId:  ProductsCubit.get(context).lowestPrice![widget.index].id.toString());
//     super.initState();
//     // Initialize the main slider controller
//     _mainSliderController = CarouselController();
//   }
//   @override
//   void didChangeDependencies() {
//     mountProduct = 1;
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var product = widget.cubit;
//     double newPrice =
//     calculateTheNewPrice(double.parse(
//         product![widget.index].price!),
//         double.parse( product.lowestPrice![widget.index].discountAmount!));
//
//     return Scaffold(
//       appBar: appBarDefaultTheme(context: context, isReverse: true, title: 'معلومات المنتج'),
//
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: BlocConsumer<widget.bloc, widget.state>(
//           listener: (context, state) {},
//           builder: (context, state) => Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 20.h,),
//
//                       // Main photo slider
//                       product![widget.index].images!.isNotEmpty ?
//                       CarouselSlider(
//                         carouselController: _mainSliderController,
//
//                         options: CarouselOptions(
//                           height: 188.h,
//                           enlargeCenterPage: true,
//                           initialPage: _currentImageIndex,
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               _currentImageIndex = index;
//                             });
//                           },
//                         ),
//                         items: product![widget.index].images!.map((image) {
//                           return Builder(
//                             builder: (BuildContext context) {
//                               return ClipRRect(
//                                 borderRadius: BorderRadius.circular(16.r),
//                                 child: Image.network(
//                                   image.image_path.toString(),
//                                   fit: BoxFit.contain,
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                       ) : Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 3.0.r),
//                           child: SizedBox(
//                             height: 188.h,
//                             child: ClipRRect(
//                               borderRadius:
//                               BorderRadius.circular(16.r),
//                               child: Image.network(
//                                 product![0]
//                                     .image.toString(),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       //: Container(),
//
//                       SizedBox(height: 15.h,),
//
//                       // Small photo slider
//                       //   product.lowestPrice![widget.index].images!.isEmpty ?
//                       Center(
//                         child: CarouselSlider(
//                           options: CarouselOptions(
//                             enableInfiniteScroll: false,
//                             onPageChanged: (index, reason) {
//                               setState(() {
//                                 _currentImageIndex = index;
//                               });
//                             },
//                             height: 60.h,
//                             viewportFraction: 0.2,
//                             enlargeCenterPage: false,
//                           ),
//                           items: product![widget.index].images!.map((image) {
//                             int index = product.lowestPrice![widget.index].images!.indexOf(image);
//                             return Container(
//                               height: 50.h,
//
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8.r),
//                                 color: _currentImageIndex == index
//                                     ? Colors.pinkAccent.shade100.withOpacity(0.4) // Change the color as needed
//                                     : Colors.transparent,
//                               ),
//                               child: Builder(
//                                 builder: (BuildContext context) {
//                                   return Container(
//                                     height: 100.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8.r),
//                                       color: _currentImageIndex == index
//                                           ?  Colors.pinkAccent.shade100.withOpacity(0.4)
//                                           : Colors.transparent,
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 5.w),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           // Set the main photo slider index to the selected image
//                                           _currentImageIndex = index;
//                                           // Jump to the selected image in the main slider
//                                           _mainSliderController.animateToPage(index,
//                                               duration: const Duration(milliseconds: 300),
//                                               curve: Curves.easeIn);
//                                         },
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(8.r),
//                                           child: Image.network(
//                                             image.image_path.toString(),
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                       //: Container(),
//
//
//                       SizedBox(height: 20.h,),
//                       Text(
//                         product![widget.index].name.toString(),
//                         style: GoogleFonts.cairo(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//
//
//                       SizedBox(height: 22.h,),
//                       Row(
//                         children: [
//                           Text(S.of(context).thePriceInDetail,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
//                           SizedBox(width: 133.w,),
//                           Text(S.of(context).amount,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
//                         ],
//                       ),
//                       SizedBox(height: 10.h,),
//                       Row(
//                         children: [
//                           Flexible(child: Text('$newPrice  ر.س ',style : GoogleFonts.cairo(fontWeight:FontWeight.bold,color: SecondColor,fontSize: 16.sp ))),
//                           product![widget.index].discountAmount.toString() != '0.00' ?
//                           Flexible(child: Text('${product.lowestPrice![widget.index].price.toString()} ر.س ',style : GoogleFonts.cairo(fontSize: 14.sp ,decoration: TextDecoration.lineThrough,color: Colors.grey))): SizedBox(),
//                           SizedBox(width: 20.w,),
//                           Stack(
//                             children: [
//                               Container(
//                                   height: 50.h,
//                                   width: 150.w,
//
//                                   decoration: BoxDecoration(
//                                     color: gridColor,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Center(child: Text(mountProduct.toString()))),
//                               Positioned(
//                                 right: 0.w,
//                                 child: Container(
//                                   height: 50.h,
//                                   width: 50.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.pinkAccent.shade100.withOpacity(0.4),
//
//                                     shape: BoxShape.circle,
//
//                                   ),
//                                   child: IconButton(
//                                     icon: const Icon(Icons.add),
//                                     onPressed: () {
//                                       setState(() {
//                                         mountProduct++;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//
//                               Positioned(
//                                 left: 0.w,
//                                 child: Container(
//                                   height: 50.h,
//                                   width: 50.w,
//                                   decoration: BoxDecoration(
//                                     color: Colors.cyan.shade100.withOpacity(0.4),
//
//                                     shape: BoxShape.circle,
//
//                                   ),
//                                   child :
//                                   IconButton(
//                                     icon: const Icon(Icons.remove),
//                                     onPressed: () {
//                                       setState(() {
//                                         if (     mountProduct > 1) {
//                                           setState(() {
//                                             mountProduct--;
//                                           });
//                                         }
//
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 23.h,),
//                       const Divider(color: fillRectangular,),
//                       ///
//
//                       SizedBox(height: 20.h,),
//                       BlocConsumer<RateCubit,RateStates>(
//                         listener: (context, state) {
//
//                         },
//                         builder: (context, state) =>  Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             RateCubit.get(context).rateSingle != null ?    Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('مراجعات المستخدمين :',
//                                         style : GoogleFonts.cairo(fontSize: 16.sp,color: fillRectangular)),
//
//                                     SizedBox(width: 10.w,),
//                                     Text(RateCubit.get(context).allRate.toString()),
//                                     Icon(Icons.star,color: Colors.amber,),
//
//
//
//                                   ],
//                                 ),
//                                 SizedBox(height: 10.h,),
//                                 Row(children: [
//                                   InkWell(
//                                     onTap: ()
//                                     {
//                                       setState(() {
//                                         isClick = !isClick;
//                                       });
//                                     },
//                                     child: Text(
//
//                                         'عرض كل المراجعات',
//                                         style : GoogleFonts.cairo(
//                                             decoration: TextDecoration.underline,
//                                             fontSize: 16.sp,color: SecondColor,
//                                             fontWeight: FontWeight.bold)),
//                                   ),
//                                   Icon(Icons.arrow_drop_down_outlined,color: SecondColor,),
//                                   Text('${RateCubit.get(context).count.toString()} تقييم ',style: GoogleFonts.cairo(color: fillRectangular),),
//
//                                 ],),
//                                 SizedBox(height: 10.h,),
//                                 isClick ?    ConditionalBuilder(
//                                   condition: RateCubit.get(context).rateSingle!.isNotEmpty ||  RateCubit.get(context).rateSingle != null ,
//                                   builder: (context) =>  BlocConsumer<RateCubit,RateStates>(
//                                     listener: (context, state) {
//
//                                     },
//                                     builder: (context, state) =>  ListView.separated(
//                                         shrinkWrap: true,
//                                         physics: const NeverScrollableScrollPhysics(),
//                                         itemBuilder: (context, index) => expandComments(
//                                             RateCubit.get(context).rateSingle![index]),
//                                         separatorBuilder: (context, index) => Divider(),
//                                         itemCount:
//                                         RateCubit.get(context).rateSingle!.length),
//                                   ),
//                                   fallback: (context) => loader(),
//                                 ) : Container(),
//                                 SizedBox(height: 10.h,),
//                               ],
//                             ) : Center(child: Text('لا يوجد تقييمات لهذا المنتج حتى الان ')),
//                             SizedBox(height: 10.h,),
//                             defaultButton(
//                                 context: context,
//                                 text: 'قيم هذا المنتج', toPage: () {
//                               SchedulerBinding.instance
//                                   .addPostFrameCallback((_) {
//                                 navigateTo(
//                                     context, ProductRateScreen(productId:
//                                 product![widget.index].id.toString()
//
//                                 ));
//                               });
//                             }
//                             ),
//                           ],
//                         ),
//                       ),
//                       ///
//                       Text(S.of(context).deliveryMethod,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
//
//                       SizedBox(height: 10.h,),
//                       Row(
//                         children: [
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 height: 15.h,
//                                 width: 15.w,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color:  Colors.blue,),
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                 ),
//                               ),
//                               Container(
//                                 height: 10.h,
//                                 width: 10.w,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.blue,
//                                   shape: BoxShape.circle,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: 5.w,),
//                           Text(S.of(context).StandardShipping,style : GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w600)),
//
//                         ],
//                       ),
//                       SizedBox(height: 25.h,),
//                       /// to do read more
//                       Text(S.of(context).Details,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product![widget.index].description.toString() == 'undefined' ? 'لا يوجد' : product.lowestPrice![widget.index].description.toString(),
//                             maxLines: showFullText ? 100 : 5, // Unlimited lines if showFullText is true
//                             overflow: TextOverflow.ellipsis,
//                             style: GoogleFonts.cairo(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//
//                           product![widget.index].description.toString().length > 100 ?
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               padding: EdgeInsets.zero,
//
//                             ),
//                             onPressed: () {
//                               // Toggle the visibility of the full text
//                               setState(() {
//                                 showFullText = !showFullText;
//                               });
//                             },
//                             child: Text(
//
//                               showFullText ? S.of(context).readLess : S.of(context).readMore,
//                               style: GoogleFonts.cairo(
//                                   fontSize: 14.sp,
//                                   decoration: TextDecoration.underline,
//                                   color: SecondColor),
//                             ),
//                           ) : Container(),
//                         ],
//                       ),
//
//                       SizedBox(height: 30.h,),
//
//
//
//
//
//                     ],
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 34.w,),
//                   BlocConsumer<CardCubit,ShoppingStates>(
//                     listener: (context, state) {
//
//                     },
//                     builder: (context, state) => buttonAddCard(
//                       context: context,
//                       text: S.of(context).AddToCar,
//                       iconText: 'assets/images/shop.svg',
//                       toPage: ()
//                       {
//                         CardCubit.get(context).addInCard(
//                             userId: idUser.toString(),
//                             productId: product.lowestPrice![widget.index].id.toString(),
//                             quantity: mountProduct.toString(),
//                             price: product![widget.index].price.toString());
//                         // product.shoppingName!.add(product.lowest_price![widget.index].name.toString());
//                         // product.shoppingPhoto!.add(product.best_discount![widget.index].image.toString());
//                         // product.shoppingPrice!.add(product.best_discount![widget.index].price.toString());
//
//                         // showToast(text: S.of(context).successAddedToCar, state: ToastStates.success);
//                         navigateTo(context, const ShoppingCar());
//                         setState(() {
//                           mountProduct = 1;
//                         });
//                       },
//                     ),
//                   ),
//
//                   SizedBox(width: 10.w,),
//                   Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 48.h,
//                     width: 46.w,
//
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: fillRectangular),
//
//                     ),
//                     child : InkWell(
//                       onTap: ()
//                       {
//                         setState(() {
//                           isFav = true ;
//                           if(isFav) {
//                             AppCubit.get(context).addFavourite(
//                                 productId: product![widget.index].id
//                                     .toString());
//                           }
//                           if(!isFav)
//                           {
//                             AppCubit.get(context).deleteFavourite(
//                                 productId: product![widget.index].id.toString());
//
//                           }
//                         });
//                       },
//                       child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
//                     ),
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: 20.h,),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
//   Widget expandComments (AllReviewsDataModel review)
//   => Padding(
//     padding:  EdgeInsets.symmetric(horizontal: 20.w),
//     child: Container(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // Text(review.),
//           // SizedBox(width: 20.w,),
//           Container(
//             height: 50.h,
//             width: 1.w,
//             color: fillRectangular,
//           ),
//           SizedBox(width: 20.w,),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(children: [
//
//                   GetCustomRating(
//                     initialRating: review.rating!.toInt(),
//                   ),
//                   SizedBox(width: 10.w),
//                   Text('${review.rating.toString()} نجوم '),
//                 ]),
//
//                 Flexible(child: Text(
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                   review.review.toString(),
//                 )),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//
// }
