import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/home_page/bottomnavItems/category_screens/productOfSub.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../DetailedScreen/all_cat_details.dart';
import '../../Products/logic/cubit.dart';
import '../../Products/logic/states.dart';

class SubCategoryScreen extends StatelessWidget {
 final int list ;
  const SubCategoryScreen(this.list);

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
            backgroundColor: gridColor,
            appBar: appBarDefaultTheme(
                context: context, isReverse: true, title:
            'ملابس', ),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
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
                    SizedBox(
                      height: 20.h,
                    ),
                   false ?
                    Center(child: Text(' لم يتم إضافة منتجات لهذا العنصر بعد',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 18.sp),))  :
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => Container(
                        height: 70.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.r)),
                        child: ListTile(
                          style: ListTileStyle.drawer,

                          onTap: ()
                          {
                            navigateTo(context,  AllCategoryDetailedScreen());
                          },
                          title: Text('تيشرت بولو قطن بأكمام قصيرة'),
                          // leading: SizedBox(
                          //   height: 50.h,
                          //   width: 50.w,
                          //   child: ClipRRect(
                          //
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     child: Image.network(
                          //       sub.all_cat![list].subcategories![index].image_url.toString(),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),

                          trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                      itemCount:5,
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
}

