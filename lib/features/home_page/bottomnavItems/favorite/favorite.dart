import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../logic/cubit.dart';
import '../../../logic/states.dart';

class FavoriteScreen extends StatefulWidget {
  bool isReverse ;
  FavoriteScreen({required this.isReverse});
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

      appBar: appBarDefaultTheme(

        title: S.of(context).favorite,
          context: context, isReverse: widget.isReverse),
      backgroundColor: gridColor,
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (context, state) {

            },
            builder: (context, state) =>

//                 Column(
//               children: [
//                 SizedBox(height: 38.h,),
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 20.0.h,
//                 crossAxisSpacing: 10.0.w,
//
//                 crossAxisCount: 2, //number of them
//                 children:
//                 List.generate(
//                  AppCubit.get(context).favProduct!.length,
//                       (index) =>
//                           InkWell(
//                               onTap: ()
//                               {
// //navigateTo(context, widget);
//                               },
//                               child: buildFavouriteItem(AppCubit.get(context).favProduct![index])),
//                 ),
//
// ),
//
//
//                ],
//             )  :
            Column(

                  children: [
                    SizedBox(height: 150.h,),
                    notFound(),
                    SizedBox(height: 10.h,),
                    Text(S.of(context).noFav,style: GoogleFonts.cairo(fontWeight: FontWeight.bold),),

                  ],
                ),
          ),
        ),
      ),

    ));
  }

  bool isFav = false ;

  Widget buildFavouriteItem () =>
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
top: 20.0.h,
          right: 10.w,
          left: 10.w,
          child: Center(child: Image.network('https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',height: 96.5.h,))),
      Positioned(
        top: 10.0.h,
        left: 20.0.w,

        child:  InkWell(
          onTap: ()
          {
            setState(() {
              isFav = ! isFav ;

            });
          },
          child: SvgPicture.asset('assets/images/heart-fill.svg', color: Colors.red, height: 30.h,width: 30.w,) ,
        ),),
      Positioned(
top:  110.h,
          right: 5.0.w,
          left: 5.0.w,
          child: Text(
            'تيشرت بولو قطن بأكمام قصيرة وشعار امامي بأطراف مضلعة للرجال من موباكو',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(
      color: primaryColor,),

  ),
      ),
      Positioned(
bottom: 10.0.h,
          right: 5.0.w,
          child: Text('20 EGP',style: GoogleFonts.cairo(
      color: SecondColor,),

  ),
      ),
      // Positioned(
      //     bottom: 40.0.h,
      //     left: 20.0.w,
      //
      //     child: SvgPicture.asset('assets/images/shop.svg')),
    ],
  );
  void refreshPage() {



  }
}

