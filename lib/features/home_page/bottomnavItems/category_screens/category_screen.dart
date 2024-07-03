import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/admin/all_users.dart';
import 'package:graduation_project/features/admin/create_products/create_product.dart';
import 'package:graduation_project/features/auth/models/login_model.dart';
import 'package:graduation_project/features/home_page/bottomnavItems/category_screens/productOfSub.dart';
import 'package:graduation_project/features/home_page/bottomnavItems/myProfile/edit_profile.dart';
import 'package:graduation_project/styles/styles.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../core/constant/end_points/end_point.dart';
import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../ShoppingCar/shopping_car.dart';
import '../../../auth/login/presentation/login.dart';
import '../../../logic/cubit.dart';
import '../../../orders/presentation/address/all_addresses.dart';
import '../../Products/logic/cubit.dart';
import '../../Products/logic/states.dart';
import '../../widgets/drawer.dart';
import '../favorite/favorite.dart';
import '../myProfile/my_profile.dart';

class CategoryScreen extends StatelessWidget {

List <String> image = [
  'assets/images/man.png',
  'assets/images/women.png',
  'assets/images/baby.png'
];
  @override
  Widget build(BuildContext context) {
    //var cat  = ProductsCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: gridColor,
        appBar: AppBar(
          leading: token != null ?  Builder(
            builder: (BuildContext context) {
              return IconButton(
                padding: EdgeInsets.zero,

                icon: SvgPicture.asset('assets/images/menu.svg',
                  fit: BoxFit.cover,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations
                    .of(context)
                    .openAppDrawerTooltip,
              );
            },) :
IconButton(onPressed: ()
{
  navigateFinish(context, LoginScreen());
}, icon: const  Icon(Icons.login,color: primaryColor,)),



          backgroundColor: Colors.white,

          elevation: 0.0,
          title: SizedBox(
              height: 60.h,
              width: 60.w,
              child: SvgPicture.asset('assets/images/logo.svg',)),

          centerTitle: true,
          actions: [

            Padding(
              padding: EdgeInsetsDirectional.only(end: 24.w),
              child: InkWell(
                  onTap: () {
                    if(token != null)
                    {
                      navigateTo(context,  ShoppingCar(reverse: false,));

                    } else {
                      showDialog(context: context, builder: (context)
                      => Dialog(
                        child: Container(
                          height: 200.h,
                          width: 366.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 40.h,),
                              Text('يجب عليك تسجيل الدخول أولا',style: Styles.style16SemiBold,),
                              SizedBox(height: 40.h,),


                              Center(
                                child: defaultButton(context: context, text: 'تسجيل الدخول',

                                  toPage: () async
                                  {


                                    navigateFinish(context, LoginScreen());



                                  },                           ),
                              ),
                            ], ),
                        ),
                      ),);
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/images/shop.svg', width: 28.w,)),
            ),
          ],

        ),
        drawer: Drawer(

          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,

                decoration: const BoxDecoration(color: SecondColor),

                accountName: Text(
                    "$nameF $nameL"),
                accountEmail: Text(
                  emailUser.toString()),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
photo.toString(),

              ))),
//                   InkWellWidget(icon: Icons.speed_outlined, text: S.of(context).controlPage, onTap: () {
// navigateTo(context, const ControlPage());
//                   }),


              InkWellWidget(
                  icon: Icons.person, text: S
                  .of(context)
                  .profile, onTap: () {
                AppCubit.get(context).updateMeFun();
                navigateTo(context, MyProfile(isReverse: true));
              }),
              // InkWellWidget(icon: Icons.shopping_cart, text: S
              //     .of(context)
              //     .orders, onTap: () {
              //   navigateTo(
              //       context, MyOrdersScreen(isReverse: true));
              // }),
              InkWellWidget(icon: Icons.favorite, text: S
                  .of(context)
                  .favorite, onTap: () {
                navigateTo(
                    context, FavoriteScreen(isReverse: true,));
              }),
              InkWellWidget(icon: Icons.settings, text: 'الاعدادات', onTap: () {
                navigateTo(context,  EditProfile());
              }),

              (token != null && role == "super admin") ?  InkWellWidget(icon: Icons.supervised_user_circle_sharp, text: 'جميع المستخدمين', onTap: () {
                AppCubit.get(context).AllUsersFun();
                navigateTo(context,  AllUsersScreen());
              }) : Container(),

              InkWellWidget(icon: Icons.logout, text: S
                  .of(context)
                  .logOut,
                onTap: () async
                {
                  await CacheHelper.clearAll().then((value) {
                    value = true;
                    if (value) {
                      navigateFinish(context, LoginScreen());
                    }
                  });
                },),


            ],
          ),
        ),
        body: BlocConsumer<ProductsCubit,ProductStates>(
          listener: (context, state) {

          },
          builder: (context, state) =>
           ConditionalBuilder(
             condition: true,
               builder: (context) =>      Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 20.w),
                 child: SingleChildScrollView(
                   physics: const BouncingScrollPhysics(),
                   child: Column(
                     children: [
                       SizedBox(height: 30.h,),
                       ListView.builder(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: ProductsCubit.get(context).allProducts!.length,
                         itemBuilder: (context, index) {
                           return Column(
                             children: [
                               InkWell(
                                 onTap: () {
                                   navigateTo(context, ProductOfSub(indexCat: index,));
                                 },
                                 child: catBuilder(index, ProductsCubit.get(context).allProducts![index]),
                               ),
                               SizedBox(height: 20.0.h),
                             ],
                           );
                         },
                       ),

                     ],
                   ),
                 ),
               ),
               fallback: (context) => Scaffold(
                   backgroundColor:  Colors.pinkAccent.shade100.withOpacity(0.5),
                   body: Center(child: loader())),

           ),
        ),

        floatingActionButton: (token != null && role != "user") ? FloatingActionButton(onPressed:
            ()
        {
          navigateTo(context, CreateProductScreen());
        }, child: const Icon(Icons.add),) : Container(),
      ),
    );
  }
  Widget catBuilder (int i,DataAll data) => Stack(
    children: [
      Container(
        height: 200.h,
        width: 200.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(5,5),
              color: fillRectangular.withOpacity(0.4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,

        ),
      ),

      Positioned(
          top: 10.0.h,
          left: 30.w,
          right: 30.w,
          child: Center(child: Image.asset(image[i],height: 96.5.h,))),


      Positioned(
        top: 140.0.h,
        right: 27.0.w,
        left: 23.0.w,
        bottom: 0.h,
        child: Text(


          ' ملابس ${data.category} ',style: GoogleFonts.cairo(
            color: SecondColor, fontSize: 16.sp, fontWeight: FontWeight.w500)
          ,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

        ),
      ),
    ],
  );
}
