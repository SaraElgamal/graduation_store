import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/auth/models/login_model.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles/styles.dart';
import '../../../DetailedScreen/all_cat_details.dart';
import '../../Products/logic/cubit.dart';
import '../../Products/logic/states.dart';

class ProductOfSub extends StatelessWidget {
  final int indexCat ;

    ProductOfSub({required this.indexCat,});

  @override
  Widget build(BuildContext context) {
    var sub = ProductsCubit.get(context);
    return BlocConsumer<ProductsCubit,ProductStates>(

      listener: (context, state) {

      },
      builder: (context, state) =>  ConditionalBuilder(
        condition: true,
        builder: (context) =>  SafeArea(
          child: Scaffold(
            appBar: appBarDefaultTheme(

                context: context, isReverse: true, title: 'الانواع'),
            backgroundColor: gridColor,
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [


                    SizedBox(
                      height: 30.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => InkWell(
                          onTap: ()
                          {
                            navigateTo(context, AllCategoryDetailedScreen(indexCat: indexCat,indexProduct: index,));
                          },
                          child: listViewItemsSub(sub.allProducts![indexCat].products![index],context)),
                      itemCount: sub.allProducts![indexCat].products!.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        fallback: (context) => Scaffold(
            backgroundColor:  Colors.pinkAccent.shade100.withOpacity(0.5),
            body: Center(child: loader())),
      ),
    );
  }

  bool isFav = false ;
  Widget listViewItemsSub (DataProductsDetails data,context) =>  Stack(
        children: [
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),


          data.details!.isNotEmpty ?   Positioned(
            left: 240.w,
            right: 8.w,
            top: 2.h,

            child: Container(
              height: 112.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
fit: BoxFit.cover,
                  image: NetworkImage(

                    data.details![0].file.toString(),

                  ),

                ),

              ),
            ),
          ) : Container(),

          data.discount != null ?  Positioned(
            top: 0.h,
            right: 5.w,
           // left: 5.w,
            child: Container(
              height: 30.h,
              width: 54.w,
              color: Colors.red,
              child: Center(
                child: Text('${data.discount.toString() } %',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.white),),
              ),
            ),
          ) : Container(),
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
            right: 130.w,
            left: 5.w,
            child: Text(data.name.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
          ),

          Positioned(
            top: 40.h,
            right: 130.w,
            left: 5.w,
            child: Text('النوع:',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
  style: Styles.style14Bold ,
          ),
          ),
          Positioned(
            top: 40.h,
            right: 170.w,
            left: 5.w,
            child: Text(data.typeOfCloth.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500),),
          ),
          Positioned(
            top: 40.h,
            //right: 130.w,
            left: 20.w,
            child: Text("(${data.brand.toString()})",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.blue),),
          ),
          Positioned(
            top: 70.h,
            right: 130.w,
            left: 131.w,
            child:  Text(S.of(context).thePriceInDetail,style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700),),

          ),
          Positioned(
            top: 70.h,
            right: 180.w,
            left: 5.w,
            child:  Text('  ${data.priceAfterDiscount.toString()} جنيها  ',style: GoogleFonts.cairo(fontSize: 16.sp,fontWeight: FontWeight.w700,color: SecondColor),),

          ),
          data.discount != null ?     Positioned(
            top: 70.h,
           // right: 200.w,
            left: 8.w,
            child:  Text('  ${data.price.toString()} جنيها  ',style: GoogleFonts.cairo(fontSize: 14.sp,fontWeight: FontWeight.w700,color: primaryColor.withOpacity(0.4),decoration: TextDecoration.lineThrough),),

          ) : Container(),
//           Positioned(
//             top: 70.h,
//             left: 20.w,
// child : SvgPicture.asset('assets/images/add_car.svg'),
//           ),




        ],

  );

}
