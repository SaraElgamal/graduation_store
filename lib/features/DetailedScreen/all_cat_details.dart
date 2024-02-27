


import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constant/components/components.dart';
import '../../core/constant/const/const.dart';
import '../../generated/l10n.dart';
import '../ShoppingCar/shopping_car.dart';
import '../ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import '../ShoppingCar/shopping_logic/shopping_logic_state.dart';
import '../home_page/Products/logic/cubit.dart';
import '../home_page/Products/logic/states.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';
int mountProduct = 1;
class AllCategoryDetailedScreen extends StatefulWidget {


  AllCategoryDetailedScreen();
  @override
  State<AllCategoryDetailedScreen> createState() => _AllCategoryDetailedScreenState();
}

class _AllCategoryDetailedScreenState extends State<AllCategoryDetailedScreen> {

  bool isFav = false;
  bool showFullText = false;
  int _currentImageIndex = 0;
  // Track the current image index for the small slider
  bool isClick = false;
  late CarouselController _mainSliderController;
  double calculateTheNewPrice(double originalPrice, double discountAmount) {
    return originalPrice - discountAmount;
  }
  List<String> images = [
    'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',

  ];
  @override
  void initState() {


    super.initState();
    // Initialize the main slider controller
    _mainSliderController = CarouselController();
  }
  @override
  void didChangeDependencies() {
    mountProduct = 1;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var sub = ProductsCubit.get(context);
    var cart = CardCubit.get(context);

    return BlocConsumer<ProductsCubit,ProductStates>(

      listener: (context, state) {

      },
      builder: (context, state) =>  ConditionalBuilder(
        condition: true,
      //  (sub.allProducts!.isNotEmpty && sub.allProducts != null ),
        builder: (context) {


            return Scaffold(
              appBar: appBarDefaultTheme(context: context, isReverse: true, title: 'معلومات المنتج'),

              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BlocConsumer<ProductsCubit, ProductStates>(
                  listener: (context, state) {},
                  builder: (context, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h,),

                              // Main photo slider
                             true ?
                              CarouselSlider(
                                carouselController: _mainSliderController,

                                options: CarouselOptions(
                                  height: 188.h,
                                  enlargeCenterPage: true,
                                  initialPage: _currentImageIndex,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentImageIndex = index;
                                    });
                                  },
                                ),
                                items: images.map((image) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(16.r),
                                        child: Image.network(
                                          images[0].toString(),
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ) : Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.0.r),
                                  child: SizedBox(
                                    height: 188.h,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(16.r),
                                      child: Image.network(
                                        'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            true ?
                              SizedBox(height: 15.h,) : Container(),

                              // Small photo slider
                             true ?
                              Center(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentImageIndex = index;
                                      });
                                    },
                                    height: 60.h,
                                    viewportFraction: 0.2,
                                    enlargeCenterPage: false,
                                  ),
                                  items: images.map((image) {
                                    int index = images.indexOf(image);
                                    return Container(
                                      height: 50.h,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: _currentImageIndex == index
                                            ? Colors.pinkAccent.shade100.withOpacity(0.4) // Change the color as needed
                                            : Colors.transparent,
                                      ),
                                      child: Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r),
                                              color: _currentImageIndex == index
                                                  ?  Colors.pinkAccent.shade100.withOpacity(0.4)
                                                  : Colors.transparent,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Set the main photo slider index to the selected image
                                                  _currentImageIndex = index;
                                                  // Jump to the selected image in the main slider
                                                  _mainSliderController.animateToPage(index,
                                                      duration: const Duration(milliseconds: 300),
                                                      curve: Curves.easeIn);
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.r),
                                                  child: Image.network(
                                                    images[0].toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ) : Container(),


                              SizedBox(height: 20.h,),
                              Text(
                                'قميص بولو عادي من موباكو الباذنجاني',
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),


                              SizedBox(height: 22.h,),
                              Row(
                                children: [
                                  Text(S.of(context).thePriceInDetail,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                                  SizedBox(width: 133.w,),
                                  Text(S.of(context).amount,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Flexible(child: Text('500 EGP ',style : GoogleFonts.cairo(fontWeight:FontWeight.bold,color: SecondColor,fontSize: 16.sp ))),
                                 true ?
                                  Flexible(child: Text('500 EGP',style : GoogleFonts.cairo(fontSize: 14.sp ,decoration: TextDecoration.lineThrough,color: Colors.grey))): SizedBox(),
                                  SizedBox(width: 20.w,),
                                  Stack(
                                    children: [
                                      Container(
                                          height: 50.h,
                                          width: 150.w,

                                          decoration: BoxDecoration(
                                            color: gridColor,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(child: Text(mountProduct.toString()))),
                                      Positioned(
                                        right: 0.w,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            color: Colors.pinkAccent.shade100.withOpacity(0.4),

                                            shape: BoxShape.circle,

                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                mountProduct++;
                                              });
                                            },
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        left: 0.w,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan.shade100.withOpacity(0.4),

                                            shape: BoxShape.circle,

                                          ),
                                          child :
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (mountProduct > 1) {
                                                  setState(() {
                                                    mountProduct--;
                                                  });
                                                }

                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 23.h,),
                              const Divider(color: fillRectangular,),
                              ///

                              SizedBox(height: 20.h,),
                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,

                                       children: [


                                        SizedBox(height: 10.h,),



                              ///
                              SizedBox(height: 10.h,),
                              Text(S.of(context).deliveryMethod,style : GoogleFonts.cairo(fontWeight: FontWeight.w700,)),

                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 15.h,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(color:  Colors.blue,),
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: 10.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text(S.of(context).StandardShipping,style :
                                  GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w600)),

                                ],
                              ),
                              SizedBox(height: 25.h,),
                              /// to do read more
                              Text(S.of(context).Details,style :
                              GoogleFonts.cairo(fontWeight: FontWeight.w700,)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   'يعتبر قميص بولو موباكو الباذنجاني مثاليًا للارتداء غير الرسمي أو الرياضي. يتميز قميص البولو هذا بمقاس عادي يسمح بارتدائه بشكل موحد. إنه مـصنوع من القطن عالي الجودة لضمان الاستخدام الدائم والناعم. يحتوي قميص بولو على شعار مطبوع على الصدر لإضافة مظهر مذهل.' ,
                                    maxLines: showFullText ? 200 : 2, // Unlimited lines if showFullText is true
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),


    TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,

                                    ),
                                    onPressed: () {
                                      // Toggle the visibility of the full text
                                      setState(() {
                                        showFullText = !showFullText;
                                      });
                                    },
                                    child: Text(

                                      showFullText ? S.of(context).readLess : S.of(context).readMore,
                                      style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          decoration: TextDecoration.underline,
                                          color: SecondColor),
                                    ),
                                  ) ,
                                ],
                              ),

                              SizedBox(height: 30.h,),





                            ],
                          ),

                      Row(
                        children: [
                          SizedBox(width: 34.w,),

                          BlocConsumer<CardCubit,ShoppingStates>(
                            listener: (context, state) {

                            },
                            builder: (context, state) => buttonAddCard(
                              context: context,
                              text: S.of(context).AddToCar,
                              iconText: 'assets/images/shop.svg',
                              toPage: (){


                                // CardCubit.get(context).addInCard(
                                //   userId: idUser.toString(),
                                //     productId: sub.allProducts![a].id.toString(),
                                //     quantity: mountProduct.toString(),
                                //     price: sub.allProducts![a].price.toString());

                                navigateTo(context, const ShoppingCar());
                               setState(() {
                                 mountProduct = 1;
                               });
                              },
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          BlocConsumer<AppCubit,AppStates>(
                            listener: (context, state) {

                            },
                            builder: (context, state) =>

                                Container(
                              padding: const EdgeInsets.all(5),
                              height: 48.h,
                              width: 46.w,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: fillRectangular),

                              ),
                              child : InkWell(
                                onTap: ()
                                {
                                  setState(() {
                                    isFav = true ;
                                    if(isFav) {
                                      // AppCubit.get(context).addFavourite(
                                      //     productId: sub.allProducts![a].id
                                      //         .toString());

                                    }
                                   if(!isFav)
                                  {
                                    // AppCubit.get(context)
                                    //     .deleteFavourite
                                    //   (productId: AppCubit.get(context).favProduct![a].id.toString());

                                  }
                                  });
                                },
                                child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
               ], ),
              ),
            ),
         ], ),
          ),
         ), );
          },




        fallback: (context) => Scaffold(
            backgroundColor:  Colors.pinkAccent.shade100.withOpacity(0.5),
            body: Center(child: loader())),
      ),
    );



  }

  Widget expandComments () => Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.w),
    child: Container(
      width: double.infinity,
      child: Row(
mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: 50.h,
            width: 1.w,
            color: fillRectangular,
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [

                  SizedBox(width: 10.w),
                  Text('5 نجوم '),
                ]),

                Flexible(child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
'nice',
                )),

              ],
            ),
          ),
        ],
      ),
    ),
  );

}

