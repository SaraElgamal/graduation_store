import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../core/constant/end_points/end_point.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles/styles.dart';
import '../../../auth/login/presentation/login.dart';
import '../../../auth/models/login_model.dart';
import '../../../logic/cubit.dart';
import '../../../logic/states.dart';
import '../../Products/logic/cubit.dart';
import '../../Products/logic/states.dart';

class FavoriteScreen extends StatefulWidget {
  bool isReverse ;
  FavoriteScreen({required this.isReverse});
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    if(token != null) {
      ProductsCubit.get(context).getFavFun();
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);
    return SafeArea(child:
   token != null ?  Scaffold(

      appBar: appBarDefaultTheme(
actions: [
  TextButton(onPressed: ()
  {
    cubit.deleteAllFavFun();
  }, child: const Text('حذف الكل',style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,decorationColor: Colors.red),))
],
        title: S.of(context).favorite,
          context: context, isReverse: widget.isReverse),
      backgroundColor: gridColor,
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<ProductsCubit,ProductStates>(
            listener: (context, state) {

            },
            builder: (context, state) {

    if(state is PostLoadingFavState ||  state is GetLoadingFavState || state is DeleteFavLoadingProduct || state is DeleteAllFavLoadingProduct) {

    return Center(child: loader());
    } else {
    return
    cubit.fav!.isNotEmpty ? Column(
    children: [
    SizedBox(height: 38.h,),
    GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    mainAxisSpacing: 20.0.h,
    crossAxisSpacing: 10.0.w,

    crossAxisCount: 2, //number of them
    children:
    List.generate(
    cubit.fav!.length,
    (index) =>
    InkWell(
    onTap: ()
    {
//navigateTo(context, widget);
    },
    child: buildFavouriteItem(cubit.fav![index])),
    ),

    ),


    ],
    ) :
    Column(

    children: [
    SizedBox(height: 150.h,),
    notFound(),
    SizedBox(height: 10.h,),
    Text(S.of(context).noFav,style: GoogleFonts.cairo(fontWeight: FontWeight.bold),),

    ],
    );
    }}
       ),


        ),
      ),

    )

     : Scaffold(
      body:  Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('ليس لديك حساب قم بتسجيل دخولك',style: Styles.style16SemiBold,),
        SizedBox(height: 20.h,),
        defaultButton(
          context: context, text: 'تسجيل الدخول', toPage: ()
        {
          navigateFinish(context, LoginScreen());
        },),

      ],
    ),

    ) ,


    ),
    );
  }



  Widget buildFavouriteItem (DataProductsDetails data) =>
  Stack(
    children: [
      Container(
        height: 200.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,

        ),
      ),

      Positioned(

          right: 20.w,
          top: 20.0.h,

          child: Center(child:
          Container(
            height: 110.h,
            width: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                 fit: BoxFit.cover,
                image: NetworkImage(


                data.details![0].file.toString(),),)
            ),


          ))),
      Positioned(
        top: 10.0.h,
        left: 20.0.w,

        child:  InkWell(
          onTap: ()
          {
            setState(() {
            ProductsCubit.get(context).deleteFromFavFun(productId: data.id);

            });
          },
          child: SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) ,
        ),),
      Positioned(
top:  130.h,
          right: 10.0.w,
          left: 5.0.w,
          child: Text(
            data.name.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(
      color: primaryColor,),

  ),
      ),
      Positioned(
bottom: 2.0.h,
          right: 10.0.w,
          child: Text(data.priceAfterDiscount.toString(),style: GoogleFonts.cairo(
      color: SecondColor,),

  ),
      ),

      Positioned(
        bottom: 5.0.h,
        right: 60.0.w,
        child: Text("  ${data.price.toString()} جنيها ",style: GoogleFonts.cairo(
          color: Colors.grey,
        decoration: TextDecoration.lineThrough
        ),

        ),
      ),
      // Positioned(
      //     bottom: 40.0.h,
      //     left: 20.0.w,
      //
      //     child: SvgPicture.asset('assets/images/shop.svg')),
    ],
  );

}

