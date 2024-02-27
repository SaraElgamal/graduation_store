import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';

import '../../core/constant/components/components.dart';
import '../../core/constant/const/const.dart';
import '../../generated/l10n.dart';
import '../orders/presentation/address/all_addresses.dart';

bool cardBook = false ;
// double calculateTotalPrice(context) {
//   double totalPrice = 0.0;
//
//   for (int i = 0; i < CardCubit.get(context).cardProducts!.length; i++) {
//     double itemPrice = double.parse(CardCubit.get(context).cardProducts![i].price.toString());
//     int quantity = CardCubit.get(context).cardProducts![i].quantity!.toInt();
//
//     totalPrice += itemPrice * quantity;
//   }
//
//   return totalPrice;
// }
class ShoppingCar extends StatefulWidget {
  const ShoppingCar({Key? key}) : super(key: key);

  @override
  State<ShoppingCar> createState() => _ShoppingCarState();
}

class _ShoppingCarState extends State<ShoppingCar> {

@override
  void initState() {

    // CardCubit.get(context).getUserCard(userId:
    // idUser.toString());



    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // CardCubit.get(context).getUserCard(userId:
    // idUser!.toString());

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: gridColor,
      appBar: appBarDefaultTheme
        (
          context: context,
          isReverse: true,
          title: S.of(context).shopCar
      ),
      body:

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocConsumer<CardCubit,ShoppingStates>(

                listener: (context, state) {

                },
                builder: (context, state) {
                  if(state is PostLoadingDeleteCardState ||  state is PostLoadingGetCardState) {

                    return Center(child: loader());
                  } else {
                    return

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        ListView.separated
                          (
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, i) {

                  return listViewItemsCar(i,2);
                  },
                            separatorBuilder: (context, i) =>
                            const Divider(color: fillRectangular),
                            itemCount:
                           5),

                        const Divider(color: fillRectangular),
                        Row(
                          children: [
                            Flexible(child: Text(
                              'مجموع قيمة الفاتورة بالريال السعودي ',
                              style: GoogleFonts.cairo(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),)),
                            const Spacer(),

                            /// here the total price
                            Text('663 EGP ', style: GoogleFonts.cairo(
                                fontSize: 16.sp, fontWeight: FontWeight.w700),),

                          ],
                        ),
                        SizedBox(height: 59.h),
                        MaterialButton(

                          onPressed: () {

                              navigateTo(context, const AllAddresses());

                            setState(() {
                              cardBook = true ;
                            });
                            // navigateTo(context, const PaymentScreen());
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 13.h, horizontal: 90.w),
                          height: 48.h,
                          minWidth: 241.w,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),

                          color: SecondColor,
                          child: Center(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/shop.svg', color: Colors.white,),
                                SizedBox(width: 10.w,),
                                Text(
                                  'إتمام عملية الشراء',
                                  style: GoogleFonts.tajawal(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  // : nothing(text: S.of(context).noShop);
                  }
                },
              ),
            ),
          )


    );


  }

bool isQuantityChanged = false;
// int  mountProduct = 1;
  Widget listViewItemsCar ( int i, int currentQuantity) {





   //
   // double result =
   //     double.parse(CardCubit.get(context).cardProducts![i].price.toString() ?? '0.0') *
   //         double.parse(CardCubit.get(context).cardProducts![i].quantity.toString() ?? '1.0');
   //


  return  Stack(
    children: [
      Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
      ),
      Positioned(
        left: 240.w,
        right: 8.w,
        top: 10.h,

        child: Container(
          height: 112.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(

              image: NetworkImage(

                 'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg' ,
              ),

            ),

          ),
        ),
      ),
      // Positioned(
      //   top: 5.0.h,
      //   right: 5.0.w,
      //
      //   child:  InkWell(
      //     onTap: ()
      //     {
      //       // setState(() {
      //       //   isFav = ! isFav ;
      //       // });
      //     },
      //     child: isFav  ? SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) : SvgPicture.asset('assets/images/Favorite .svg', )  ,
      //   ),),
      Positioned(
        top: 16.h,
        right: 120.w,
        left: 5.w,
        child: Text(
          'قميص',

          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
      ),
      Positioned(
        top: 70.h,
        right: 120.w,
        left: 131.w,
        child:  Text(S.of(context).thePriceInDetail,style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700),),

      ),
      Positioned(
        top: 70.h,
        right: 175.w,
        left: 5.w,
        child:  Text(
            '521.2 EGP'
          ,style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700,color: SecondColor),),

      ),
      Positioned(
        top: 120.h,
        right: 100.w,

        child: Stack(
          children: [
            Container(
                height: 50.h,
                width: 150.w,

                decoration: BoxDecoration(
                  color: gridColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child:
                Text(
                    currentQuantity.toString()))),
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
                      currentQuantity++;

                      // EditCardCubit.get(context)
                      //     .editQuantity(
                      //   context,
                      //   cardId: CardCubit.get(context).cardProducts![i].id.toString(),
                      //   quantity: currentQuantity.toString(),
                      // );


                      print(currentQuantity);

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
                      if (     currentQuantity > 1) {
                        setState(() {
                          currentQuantity--;

                          // EditCardCubit.get(context)
                          //     .editQuantity(
                          //   context,
                          //   cardId: CardCubit.get(context).cardProducts![i].id.toString(),
                          //   quantity: currentQuantity.toString(),
                          // );

                          currentQuantity = currentQuantity;
                          print(currentQuantity);

                        });
                      }

                    });
                  },
                ),
              ),
            ),

          ],
        ),
      ),

      Positioned(
        top: 120.h,
        left: 20.w,
        child : IconButton(
            onPressed: ()
            {
              setState(() {
                // CardCubit.get(context)
                //     .deleteFromCard(cardId:
                // CardCubit.get(context).cardProducts![i].id.toString());



              });





            },
            icon: const Icon(Icons.delete,color: fillRectangular,)),
      ),




    ],

  ); }

//   Widget listViewItems (int i) => SizedBox(
//     height: 120.h,
//     child: Row(
//      children: [
//        Image.network( AppCubit.get(context).cardProducts![i].product!.image.toString(),),
//        SizedBox(width: 20.w),
//        Column(
//          children: [
//            SizedBox(height: 20.h),
//            Text( ProductsCubit.get(context).shoppingName![i].toString(),style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700),),
//            SizedBox(height: 10.h),
//            Text( ProductsCubit.get(context).shoppingPrice![i].toString(),style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700),),
//            Stack(
//              children: [
//                Container(
//                    height: 50.h,
//                    width: 150.w,
//
//                    decoration: BoxDecoration(
//                      color: gridColor,
//                      borderRadius: BorderRadius.circular(20),
//                    ),
//                    child: Center(child: Text(mountProduct.toString()))),
//                Positioned(
//                  right: 0.w,
//                  child: Container(
//                    height: 50.h,
//                    width: 50.w,
//                    decoration: BoxDecoration(
//                      color: Colors.pinkAccent.shade100.withOpacity(0.4),
//
//                      shape: BoxShape.circle,
//
//                    ),
//                    child: IconButton(
//                      icon: const Icon(Icons.add),
//                      onPressed: () {
//                        setState(() {
//                          mountProduct++;
//                        });
//                      },
//                    ),
//                  ),
//                ),
//
//                Positioned(
//                  left: 0.w,
//                  child: Container(
//                    height: 50.h,
//                    width: 50.w,
//                    decoration: BoxDecoration(
//                      color: Colors.cyan.shade100.withOpacity(0.4),
//
//                      shape: BoxShape.circle,
//
//                    ),
//                    child :
//                    IconButton(
//                      icon: const Icon(Icons.remove),
//                      onPressed: () {
//                        setState(() {
//                          if (     mountProduct > 1) {
//                            setState(() {
//                              mountProduct--;
//                            });
//                          }
//
//                        });
//                      },
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//       const Spacer(),
// IconButton(
//       onPressed: ()
//       {
//
//       },
//       icon: const Icon(Icons.delete,color: fillRectangular,)),
//      ],
//     ),
//   );
}
