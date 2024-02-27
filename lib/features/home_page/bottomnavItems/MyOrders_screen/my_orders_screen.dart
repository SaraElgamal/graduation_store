import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../create_order_logic/create_order_cubit.dart';
import '../../../create_order_logic/create_order_state.dart';

class MyOrdersScreen extends StatefulWidget {
  bool isReverse ;
  MyOrdersScreen({required this.isReverse});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  getStatus (String status)
  {
    String? text ;
    switch(status)
    {
      case "0":
        text = 'قيد الانتظار';
        break;
      case "1":
        text = 'تم التأكيد';
        break;
      case "2":
        text = ' يتم تجهيز الشحنة';
        break;
        case "3":
      text = 'يتم الشحن';
      break;
      case "4":
      text = 'تم التوصيل';
      break;
      case "5":
      text = 'فشل في التوصيل';
      break;  case "6":
      text = 'الطلب ملغي';
      break;  case "7":
      text = 'قيد الارجاع';
      break;
    }
    return text ;
  }
bool click = false;
int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme
        (context: context, isReverse: widget.isReverse, title: S
          .of(context)
          .orders),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<CreateOrderCubit, CreateStates>(
            listener: (context, state) {

            },
            builder: (context, state) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h,),
                    Text(S
                        .of(context)
                        .MyAllOrders, style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w700, fontSize: 20.sp)),
                    SizedBox(height: 30.h,),
//                     false ?
//           ListView.separated
//           (
//           shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) =>
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.w),
//
//                     decoration: BoxDecoration(
//                       color :
//                       gridColor,
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 10.h,),
//
//                         Row(
//                           children: [
//
//                             Text(' السعر الكلي : ${CreateOrderCubit
//                                 .get(context)
//                                 .allOrders![index].total_amount} ريال ',
//                               style: GoogleFonts.cairo(color: primaryColor,fontWeight: FontWeight.bold),),
//
// Spacer(),
//                             BlocConsumer<EditDeleteOrderCubit,OrderEditDeleteStates>(
//                               listener: (context, state) {
//
//                               },
//                               builder: (context, state) =>  InkWell(
// onTap: ()
// {
//   EditDeleteOrderCubit.get(context)
//       .deleteOrderUser(context, orderId:  CreateOrderCubit
//       .get(context)
//       .allOrders![index].id!.toInt());
// },
//                                   child:const  Icon(Icons.cancel_outlined,
//
//                                     size: 30,
//                                     color: Colors.red,)),
//                             ),
//                           ],
//                         ),
//
//                         SizedBox(height: 20.h,),
//
//                         Row(children: [
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 selected =  index;
//                                 click = !click;
//                               });
//
//
//                             },
//                             child: Text(
//
//                                 'عرض المنتجات',
//                                 style : GoogleFonts.cairo(
//                                     decoration: TextDecoration.underline,
//                                     fontSize: 18.sp,color: SecondColor,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                        const   Icon(Icons.arrow_drop_down_outlined,color: SecondColor,),
//                           Text('( ${CreateOrderCubit
//                               .get(context)
//                               .allOrders![index].order_details!.length} ) منتج ',style: GoogleFonts.cairo(color: primaryColor,fontWeight: FontWeight.bold),),
//                         ],),
//                         SizedBox(height: 10.h,),
//                         click && selected == index ?   listViewItemsCar(context, get: CreateOrderCubit
//                             .get(context)
//                             .allOrders![index]) : Container(),
//
//                         SizedBox(height: 20.h,),
//
//                         Row(
//                           children: [
//                             Text('حالة الطلب :', style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: primaryColor),),
//                            SizedBox(width: 10.w,),
//                             Center(
//                               child: Text( getStatus (CreateOrderCubit
//                                   .get(context)
//                                   .allOrders![index].status.toString()),
//                                 style: GoogleFonts.cairo(
//                                     fontWeight: FontWeight.bold,color: SecondColor),),
//                             ),
//
//                           ],
//                         ),
//
//
//
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             CreateOrderCubit
//                                 .get(context)
//                                 .allOrders![index].payment_status.toString() ==  'unPaid' ||    CreateOrderCubit
//                                 .get(context)
//                                 .allOrders![index].payment_status.toString() ==  'unpaid' ? Container() :
//
//                             Flexible(
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(vertical: 10.h),
//                                 width: 100.w,
//                                 height: 50.h,
//                                 decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(30.r)),
//                                 child: Center(
//                                   child: Text('تم الدفع',style: GoogleFonts.cairo(
//
//                                       color: Colors.white,fontWeight: FontWeight.bold),),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 80.w),
//                             CreateOrderCubit
//                                 .get(context)
//                                 .allOrders![index].status != "6" ?
//                             Flexible(
//                               child: BlocConsumer<EditDeleteOrderCubit,OrderEditDeleteStates>(
//                                 listener: (context, state) {
//
//                                 },
//                                 builder: (context, state) {
//                                   if (state is LoadingOrderEditStates) {
//                                     return loader();
//                                   } else {
//                                     return ElevatedButton(
//
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: SecondColor,
//                                       ),
//
//                                       onPressed: () {
//                                         EditDeleteOrderCubit.get(context)
//                                             .editOrderUser(context,
//                                             orderId: CreateOrderCubit
//                                                 .get(context)
//                                                 .allOrders![index].id!.toInt());
//                                       },
//                                       child: Text(' الغاء الطلب',
//                                         style: GoogleFonts.cairo(
//                                             decoration: TextDecoration
//                                                 .underline,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold),),
//                                     );
//                                   }
//
//
//                                 }
//                               ),
//                             )
//                                 : Container(),
//
//                           ],
//                         ),
//                         SizedBox(height: 20.h,),
//                       ],
//                     ),
//                   ),
//               separatorBuilder: (context, index) =>
//               const Divider(color: fillRectangular),
//               itemCount: CreateOrderCubit
//                   .get(context)
//                   .allOrders!
//                   .length):

                    Center( child: Column(
                              children: [

                                Lottie.asset('assets/animation/Animation - 1707786695011.json'),

                                Text(

                                  'لا يوجد لديك طلبات حاليا',
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),

                  ],
                ),
          ),
        ),
      ),

    );
  }

  Widget listViewItemsCar(context, ) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          // double result =
          //     double.parse(get.order_details![index].price.toString() ?? '0.0') *
          //         double.parse(get.order_details![index].quantity.toString() ?? '1.0');


          return Stack(
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

                      'https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',
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
                child: Text('تيشرت بولو قطن بأكمام قصيرة وشعار امامي بأطراف مضلعة للرجال من موباكو',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp, fontWeight: FontWeight.w500),),
              ),
              Positioned(
                top: 70.h,
                right: 120.w,
                left: 131.w,
                child: Text(S
                    .of(context)
                    .thePriceInDetail, style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),),

              ),
              Positioned(
                top: 70.h,
                right: 175.w,
                left: 5.w,
                child: Text(
                  '213.0 EGP',
                  style: GoogleFonts.cairo(fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: SecondColor),),

              ),
              Positioned(
                top: 100.h,
                right: 120.w,
                left: 131.w,
                child: Text('الكمية : ', style: GoogleFonts.cairo(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),),

              ),
              Positioned(
                top: 100.h,
                right: 180.w,
                left: 5.w,
                child: Text(
                  '1',
                  style: GoogleFonts.cairo(fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: SecondColor),),

              ),

            ],

          );
        }
    );
  }

}
