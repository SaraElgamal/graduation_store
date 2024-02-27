//
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../core/constant/components/components.dart';
// import '../../../core/constant/components/custom_dot.dart';
// import '../../../core/constant/const/const.dart';
// import '../../../core/data_base/cache_helper/cache_helper.dart';
// import '../../../generated/l10n.dart';
// import '../../DetailedScreen/detailed_best_discount.dart';
// import '../../logic/cubit.dart';
// import '../../update_profile/update_profile_logic/update_profile_cubit.dart';
// import '../widgets/drawer.dart';
// import 'category_screens/subCategory.dart';
//
// bool isArabic1 = true;
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int currentImage = 0;
//
//
//   final PageController _pageController =
//   PageController(initialPage: 1, viewportFraction: 1);
//
//   @override
//   void initState() {
//     super.initState();
//
//    // ProductsCubit.get(context).getBestOffers();
//     _pageController.addListener(() {
//       setState(() {
//         currentImage = _pageController.page!.round();
//       });
//     });
//     Future.delayed(const Duration(seconds: 2), () {
//       _animateSlider();
//     });
//    // ProfileUserCubit.get(context).getProfile();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _animateSlider();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   String selectedLanguage = 'العربية';
//
//   void _showLanguageMenu(BuildContext context) async {
//     String? result = await showMenu(
//       context: context,
//
//       position: RelativeRect.fromLTRB(50.w, 600.h, 50.w, 0),
//       items: [
//         PopupMenuItem(
//           value: 'العربية',
//           child: Row(
//             children: [
//               const Text('العربية'),
//               const Spacer(),
//               if (selectedLanguage == 'العربية') const Icon(
//                 Icons.check, color: primaryColor, size: 20,),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: 'English',
//           child: Row(
//             children: [
//               const Text('English'),
//               const Spacer(),
//               if (selectedLanguage == 'English') const Icon(
//                 Icons.check, color: primaryColor, size: 20,),
//             ],
//           ),
//         ),
//       ],
//       elevation: 8.0,
//     );
//
//     if (result != null) {
//       setState(() {
//         selectedLanguage = result;
//         if (result == 'العربية') {
//           isArabic1 = true;
//           AppCubit.get(context).changeSelect(isArabic1);
//         } else {
//           isArabic1 = false;
//           AppCubit.get(context).changeSelect(isArabic1);
//         }
//       });
//     }
//   }
//
//   void _animateSlider() {
//     if (currentImage < ProductsCubit
//         .get(context)
//         .banners!
//         .length - 1) {
//       currentImage++;
//     } else {
//       currentImage = 0;
//     }
//     if (mounted) {
//       _pageController.animateToPage(
//         currentImage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.ease,
//       );
//     }
//
//     Future.delayed(const Duration(seconds: 2), () {
//       _animateSlider();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var product = ProductsCubit.get(context);
//     return SafeArea(
//       child: BlocConsumer<ProductsCubit, ProductStates>(
//         listener: (context, state) {
//
//         },
//         builder: (context, state) {
//           return ConditionalBuilder(
//               condition:
//               (product.banners!.isEmpty && product.banners == null)
//                   || (product.best_discount!.isNotEmpty &&
//                   product.best_discount != null)
//                   || (product.lowestPrice!.isNotEmpty &&
//                   product.lowestPrice != null),
//               builder: (context) =>
//                   Scaffold(
//                     backgroundColor: gridColor,
//                     appBar: AppBar(
//                       leading: Builder(
//                         builder: (BuildContext context) {
//                           return IconButton(
//                             padding: EdgeInsets.zero,
//
//                             icon: SvgPicture.asset('assets/images/menu.svg',
//                               fit: BoxFit.cover,
//                               color: Colors.black,
//                             ),
//                             onPressed: () {
//                               Scaffold.of(context).openDrawer();
//                             },
//                             tooltip: MaterialLocalizations
//                                 .of(context)
//                                 .openAppDrawerTooltip,
//                           );
//                         },),
//
//
//                       backgroundColor: Colors.white,
//
//                       elevation: 0.0,
//                       title: SizedBox(
//                           height: 60.h,
//                           width: 60.w,
//                           child: SvgPicture.asset('assets/images/logo.svg',)),
//
//                       centerTitle: true,
//                       actions: [
//                         // Padding(
//                         //   padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
//                         //   child: InkWell(
//                         //       onTap: ()
//                         //       {
//                         //         navigateTo(context, const NotificationScreen());
//                         //       },
//                         //       child: SvgPicture.asset('assets/images/Notifications.svg',width: 32.w)),
//                         // ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.only(end: 24.w),
//                           child: InkWell(
//                               onTap: () {
//                                 navigateTo(context, const ShoppingCar());
//                               },
//                               child: SvgPicture.asset(
//                                 'assets/images/shop.svg', width: 28.w,)),
//                         ),
//                       ],
//
//                     ),
//                     drawer: Drawer(
//
//                       backgroundColor: Colors.white,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//
//                           UserAccountsDrawerHeader(
//                             margin: EdgeInsets.zero,
//
//                             decoration: const BoxDecoration(color: SecondColor),
//
//                             accountName: Text(ProfileUserCubit
//                                 .get(context)
//                                 .profile!
//                                 .name
//                                 .toString()),
//                             accountEmail: Text(ProfileUserCubit
//                                 .get(context)
//                                 .profile!
//                                 .email
//                                 .toString()),
//                             currentAccountPicture: CircleAvatar(
//                               backgroundColor: Colors.white,
//                               backgroundImage: NetworkImage(ProfileUserCubit
//                                   .get(context)
//                                   .profile!
//                                   .imageProfile
//                                   .toString())),
//
//
//                           ),
// //                   InkWellWidget(icon: Icons.speed_outlined, text: S.of(context).controlPage, onTap: () {
// // navigateTo(context, const ControlPage());
// //                   }),
//
//
//                           InkWellWidget(
//                               icon: Icons.person, text: S
//                               .of(context)
//                               .profile, onTap: () {
//                             navigateTo(context, MyProfile(isReverse: true));
//                           }),
//                           InkWellWidget(icon: Icons.shopping_cart, text: S
//                               .of(context)
//                               .orders, onTap: () {
//                             navigateTo(
//                                 context, MyOrdersScreen(isReverse: true));
//                           }),
//                           InkWellWidget(icon: Icons.favorite, text: S
//                               .of(context)
//                               .favorite, onTap: () {
//                             navigateTo(
//                                 context, FavoriteScreen(isReverse: true,));
//                           }),
//                           InkWellWidget(icon: Icons.home_filled, text: S
//                               .of(context)
//                               .Addresses, onTap: () {
//                             navigateTo(context, const AllAddresses());
//                           }),
//
//                           // InkWellWidget(icon: Icons.language, text: S
//                           //     .of(context)
//                           //     .language, onTap: () {
//                           //   _showLanguageMenu(context);
//                           // }),
//
//                           InkWellWidget(icon: Icons.logout, text: S
//                               .of(context)
//                               .logOut,
//                             onTap: () async
//                             {
//                               await CacheHelper.clearAll().then((value) {
//                                 value = true;
//                                 if (value) {
//                                   navigateTo(context, LoginScreen());
//                                 }
//                               });
//                             },),
//
//
//                         ],
//                       ),
//                     ),
//                     body: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 24.w),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.vertical,
//                         child: Column(
//                           children: [
//                             SizedBox(height: 16.h,),
//                             searchBarField(context: context),
//
//                             SizedBox(height: 24.h,),
//                             SizedBox(
//                               height: 180.h,
//                               width: double.infinity,
//                               child: PageView.builder(
//
//                                 controller: _pageController,
//                                 itemCount:
//                                 ProductsCubit
//                                     .get(context)
//                                     .banners!
//                                     .length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Stack(
//                                     children: [
//                                       AnimatedBuilder(
//                                         animation: _pageController,
//                                         builder:
//                                             (BuildContext context,
//                                             Widget? widget) {
//                                           double value = 1.0;
//                                           if (_pageController
//                                               .position.haveDimensions) {
//                                             value =
//                                                 _pageController.page! - index;
//                                             value = (1 - (value.abs() * 0.1))
//                                                 .clamp(0.0, 2.0);
//                                           }
//                                           return Center(
//                                             child: SizedBox(
//                                               height:
//                                               Curves.easeOut.transform(value) *
//                                                   MediaQuery
//                                                       .of(context)
//                                                       .size
//                                                       .height * .30,
//                                               width:
//                                               Curves.easeOut.transform(value) *
//                                                   double.infinity,
//                                               child: Container(
//                                                 padding: const EdgeInsets.all(
//                                                     0),
//                                                 // Remove padding around the image
//                                                 child: widget,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 3.0.r),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                             BorderRadius.circular(16.r),
//                                             child: Image.network(
//                                               product.banners![index]
//                                                   .image.toString(),
//                                               fit: BoxFit.fill,
//                                             ),
//                                             //       :  Image.network( index == 0  ?
//                                             // product.banners![3]
//                                             //     .image.toString() : product.banners![index]
//                                             //     .image.toString(),
//                                             //   fit: BoxFit.fill,
//                                             // ),
//                                           ),
//                                         ),
//                                       ),
//
//                                       // Positioned(
//                                       //   bottom: 20.h,
//                                       //   left: 40.w,
//                                       //
//                                       //   child: ElevatedButton(
//                                       //       style: ElevatedButton.styleFrom(
//                                       //         backgroundColor: Colors.white,
//                                       //       ) ,
//                                       //       onPressed: ()
//                                       //       {
//                                       //
//                                       //       },
//                                       //       child:  Text(S.of(context).shopNow,style: GoogleFonts.cairo(
//                                       //           color: primaryColor
//                                       //       ),)),
//                                       //
//                                       // ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 10.h,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(
//                                 product.banners!.length,
//                                     (index) =>
//                                     CustomDot(
//
//                                       index: index,
//                                       currentIndex: currentImage,
//
//                                       color: currentImage == index
//                                           ? Theme
//                                           .of(context)
//                                           .colorScheme
//                                           .primary
//                                           : Colors.grey,
//                                     ),
//                               ),
//                             ),
//
//
//                             SizedBox(height: 32.h,),
//                             SingleChildScrollView(
//                               physics: const BouncingScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 120.0.w,
//                                     height: 40.0.h,
//                                     decoration: BoxDecoration(
//                                       color: Colors.black,
//
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                         'العروض',
//                                         style: GoogleFonts.cairo(
//                                           fontSize: 15.sp,
//                                           color: Colors.white,
//
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 10.w,),
//                                   SizedBox(
//                                     height: 40.h,
//                                     child: ListView.separated(
//                                       shrinkWrap: true,
//                                       separatorBuilder: (context, index) =>
//                                           SizedBox(
//                                             width: 10.w,
//                                           ),
//                                       scrollDirection: Axis.horizontal,
//                                       //shrinkWrap: true,
//                                       physics: const BouncingScrollPhysics(),
//                                       itemCount: product.all_cat!.length,
//                                       itemBuilder: (context, index) =>
//
//                                           InkWell(
//                                               onTap: () {
//                                                 navigateTo(context,
//                                                     SubCategoryScreen(index));
//                                               },
//                                               child: buildContainer(index,
//                                                   product.all_cat![index].name
//                                                       .toString())),
//                                     ),
//                                   ),
//
//
//                                 ],
//                               ),
//                             ),
//
//                             SizedBox(height: 24.h,),
//                             Row(
//
//                               children: [
//                                 Text(S
//                                     .of(context)
//                                     .BestDiscount, style: GoogleFonts.cairo(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 ),
//                                 const Spacer(),
//                                 // TextButton(
//                                 //
//                                 //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
//                                 //     onPressed: ()
//                                 //     {
//                                 //       // navigateTo(context, cubit.screens[1]);
//                                 //     },
//                                 //     child:  Text(
//                                 //
//                                 //       S.of(context).SeeMore,style: GoogleFonts.tajawal(
//                                 //       fontSize: 16.sp,
//                                 //       decoration: TextDecoration.underline,
//                                 //       color: fillRectangular,
//                                 //     ),
//                                 //       textAlign: TextAlign.end,
//                                 //
//                                 //
//                                 //
//                                 //     )),
//                               ],
//                             ),
//                             SizedBox(height: 10.h,),
//                             product.best_discount!.isNotEmpty ?
//                             BlocConsumer<ProductsCubit, ProductStates>(
//                                 listener: (context, state) {
//
//                                 },
//                                 builder: (context, state) {
//                                   if (state is GetLoadingBestDiscountStateProduct) {
//                                     return loader();
//                                   }
//
//                                   else {
//                                     return SizedBox(
//                                       height: 200.h,
//                                       child: ListView.separated(
//
//                                         separatorBuilder: (context, index) =>
//                                             SizedBox(
//                                               width: 10.w,
//                                             ),
//                                         scrollDirection: Axis.horizontal,
//                                         //shrinkWrap: true,
//                                         physics: const BouncingScrollPhysics(),
//                                         itemCount: product.best_discount!
//                                             .length,
//                                         itemBuilder: (context, index) =>
//
//                                             InkWell(
//                                               onTap: () {
//                                                 navigateTo(context,
//                                                     DetailedScreenBestDiscount(
//                                                       index: index,));
//                                               },
//                                               child: buildBestDiscountItem(
//                                                   product.best_discount![index]
//                                               ),
//                                             ),
//                                       ),
//                                     );
//                                   }
//                                 }
//
//                             )
//                                 : loader(),
//
//                             SizedBox(height: 66.h,),
//
//                             /// second banner
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 3.0.r),
//                               child: SizedBox(
//                                 height: 188.h,
//                                 child: ClipRRect(
//                                   borderRadius:
//                                   BorderRadius.circular(16.r),
//                                   child: Image.network(
//                                     product.banners![0]
//                                         .image.toString(),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//
//                             SizedBox(height: 24.h,),
//                             Row(
//
//                               children: [
//                                 Text(S
//                                     .of(context)
//                                     .lowestPrice, style: GoogleFonts.cairo(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 ),
//                                 const Spacer(),
//                                 // TextButton(
//                                 //
//                                 //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
//                                 //     onPressed: ()
//                                 //     {
//                                 //       // navigateTo(context, cubit.screens[1]);
//                                 //     },
//                                 //     child:  Text(
//                                 //
//                                 //      S.of(context).SeeMore,style: GoogleFonts.tajawal(
//                                 //       fontSize: 16.sp,
//                                 //       decoration: TextDecoration.underline,
//                                 //       color: fillRectangular,
//                                 //     ),
//                                 //       textAlign: TextAlign.end,
//                                 //
//                                 //
//                                 //
//                                 //     )),
//                               ],
//                             ),
//                             SizedBox(height: 10.h,),
//
//                             /// lowest
//                             BlocConsumer<ProductsCubit, ProductStates>(
//                                 listener: (context, state) {
//
//                                 },
//                                 builder: (context, state) {
//                                   if (state is GetLoadingLowestPriceStateProduct) {
//                                     return loader();
//                                   } else {
//                                     return SizedBox(
//                                       height: 200.h,
//                                       child: ListView.separated(
//
//                                         separatorBuilder: (context, index) =>
//                                             SizedBox(
//                                               width: 10.w,
//                                             ),
//                                         scrollDirection: Axis.horizontal,
//                                         shrinkWrap: true,
//                                         physics: const BouncingScrollPhysics(),
//                                         itemCount: product.lowestPrice!.length,
//                                         itemBuilder: (context, index) =>
//                                             InkWell(
//                                                 onTap: () {
//                                                   navigateTo(context,
//                                                       DetailedScreen(
//                                                         index: index,));
//                                                 },
//                                                 child: buildLowestPriceItem(
//                                                     product
//                                                         .lowestPrice![index])),
//                                       ),
//                                     );
//                                   }
//                                 }
//                             ),
//                             SizedBox(height: 30.h,),
//                             //  BlocConsumer<ProductsCubit,ProductStates>(
//                             //    listener: (context, state) {
//                             //
//                             //    },
//                             //    builder: (context, state) => Container(
//                             //      color: Colors.grey[300],
//                             //      child: GridView.count(
//                             //        shrinkWrap: true,
//                             //        physics: const NeverScrollableScrollPhysics(),
//                             //        mainAxisSpacing: 10.0,
//                             //        crossAxisSpacing: 10.0,
//                             //
//                             //        crossAxisCount: 2, //number of them
//                             //        children:
//                             //        List.generate(
//                             //          ProductsCubit.get(context).best_discount!.length,
//                             //              (index) =>
//                             //                  builderGridView(ProductsCubit.get(context).best_discount![index],context),
//                             //        ),
//                             //
//                             //      ),
//                             //    ),
//                             // ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//               fallback: (context) =>
//                   Scaffold(
//                       backgroundColor: Colors.pinkAccent.shade100.withOpacity(
//                           0.5),
//                       body: Center(child: loader())));
//         },
//       ),
//
//     );
//   }
//
//   double calculateTheNewPrice(double originalPrice, double discountAmount) {
//     return originalPrice - discountAmount;
//   }
//
//   double calculatePercentageDiscount(double originalPrice,
//       double discountedPrice) {
//     double percentDiscount = (discountedPrice / originalPrice) * 100;
//     return double.parse(percentDiscount.toStringAsFixed(2));
//   }
//
//   Widget buildBestDiscountItem(DataBestOffer price) {
//     double newPrice =
//     calculateTheNewPrice(double.parse(price.price!),
//         double.parse(price.discountAmount!));
//     double discount =
//     calculatePercentageDiscount(
//         double.parse(price.price!),
//         double.parse(price.discountAmount!));
//     return Stack(
//       children: [
//         Container(
//           height: 200.h,
//           width: 170.w,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//
//           ),
//         ),
//
//         Positioned(
//             top: 10.0.h,
//             left: 50.w,
//             right: 30.w,
//             child: Center(child: Image.network(
//               price.image.toString(), height: 96.5.h,))),
//         //         Positioned(
//         //             top: 10.0.h,
//         //             left: 10.0.w,
//         //
//         //             child:  InkWell(
//         // onTap: ()
//         // {
//         // setState(() {
//         // isFav = ! isFav ;
//         // });
//         // },
//         // child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
//         // ),),
//         price.discountAmount.toString() != '0.00' ?
//         Positioned(
//
//             left: 5.0.w,
//
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 color: Colors.red,
//
//                 child: Text('$discount %',
//                   style: GoogleFonts.cairo(color: Colors.white),)))
//             : Container(),
//         Positioned(
//           top: 120.0.h,
//           right: 5.0.w,
//           left: 23.0.w,
//           bottom: 10.w,
//           child: Text(
//
//             price.name.toString(), style: GoogleFonts.cairo(
//
//             fontSize: 12.sp,
//             color: primaryColor,
//
//           ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//
//           ),
//         ),
//         Positioned(
//           top: 140.0.h,
//           right: 5.0.w,
//           child: Text(
//             '$newPrice ر.س ',
//             style: GoogleFonts.cairo(
//                 color: Colors.redAccent,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.sp
//             ),
//
//           ),
//         ),
//
//         price.discountAmount.toString() != '0.00' ?  Positioned(
//           top: 165.0.h,
//           right: 82.0.w,
//           child: Text(
//             '${price.price.toString()} ر.س '
//             , style: GoogleFonts.cairo(
//               decoration: TextDecoration.lineThrough,
//               color: Colors.grey,
//               fontSize: 16.sp
//           ),
//
//           ),
//         ) : Container(),
//         // Positioned(
//         //     top: 170.0.h,
//         //     left: 20.0.w,
//         //
//         //     child: SvgPicture.asset('assets/images/add_car.svg')),
//       ],
//     );
//   }
//
//   bool isFav = false;
//
//   Widget buildLowestPriceItem(DataBestOffer price) {
//     double newPrice =
//     calculateTheNewPrice(double.parse(price.price!),
//         double.parse(price.discountAmount!));
//     double discount =
//     calculatePercentageDiscount(
//         double.parse(price.price!),
//         double.parse(price.discountAmount!));
//     return
//       Stack(
//         children: [
//           Container(
//             height: 200.h,
//             width: 170.w,
//             decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//
//             ),
//           ),
//
//           Positioned(
//               top: 10.0.h,
//               left: 50.w,
//               right: 30.w,
//               child: Center(child: Image.network(
//                 price.image.toString(), height: 96.5.h,))),
// //           Positioned(
// //               top: 10.0.h,
// //               left: 10.0.w,
// //
// //               child: InkWell(
// //                   onTap: ()
// //                   {
// // setState(() {
// //   isFav = ! isFav ;
// // });
// //                   },
// //                   child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
// //               )),
//           price.discountAmount.toString() != '0.00' ?
//           Positioned(
//
//               left: 5.0.w,
//
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10.w),
//                   color: Colors.red,
//
//                   child: Text('$discount %',
//                     style: GoogleFonts.cairo(color: Colors.white),)))
//               : Container(),
//           Positioned(
//             top: 120.0.h,
//             right: 5.0.w,
//             left: 23.0.w,
//             bottom: 10.w,
//             child: Text(
//
//               price.name.toString(), style: GoogleFonts.cairo(
//
//               fontSize: 12.sp,
//               color: primaryColor,
//
//             ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//
//             ),
//           ),
//           Positioned(
//             top: 140.0.h,
//             right: 5.0.w,
//             child: Text(
//               '$newPrice ر.س ',
//               style: GoogleFonts.cairo(
//                   color: Colors.redAccent,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.sp
//               ),
//
//             ),
//           ),
//
//           price.discountAmount.toString() != '0.00' ?
//           Positioned(
//             top: 165.0.h,
//             right: 82.0.w,
//             child: Text(
//               '${price.price.toString()} ر.س '
//               , style: GoogleFonts.cairo(
//                 decoration: TextDecoration.lineThrough,
//                 color: Colors.grey,
//                 fontSize: 16.sp
//             ),
//
//             ),
//           ) : Container(),
//
//
//
//
//
//           // Positioned(
//           //     top: 170.0.h,
//           //     left: 20.0.w,
//           //
//           //     child: SvgPicture.asset('assets/images/add_car.svg')),
//         ],
//       );
//
// }
//   int selectedContainerIndex = -1;
//   Widget buildContainer(int index, String text) {
//     bool isSelected = selectedContainerIndex == index;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedContainerIndex = index;
//         });
//
//   navigateTo(context, SubCategoryScreen(index));
//
//
//       },
//       child: Container(
//         width: 120.0.w,
//         height: 40.0.h,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.black : Colors.white,
//
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             text,
//             style: GoogleFonts.cairo(
//               fontSize: 15.sp,
//               color: isSelected ? Colors.white : Colors.black,
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
