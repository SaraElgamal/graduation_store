import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/home_page/bottomnavItems/category_screens/subCategory.dart';

import '../../../../core/constant/components/components.dart';
import '../../../../core/constant/const/const.dart';
import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../ShoppingCar/shopping_car.dart';
import '../../../auth/login/presentation/login.dart';
import '../../../orders/presentation/address/all_addresses.dart';
import '../../Products/logic/cubit.dart';
import '../../Products/logic/states.dart';
import '../../widgets/drawer.dart';
import '../MyOrders_screen/my_orders_screen.dart';
import '../favorite/favorite.dart';
import '../myProfile/my_profile.dart';
import '../notification/notification.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cat  = ProductsCubit.get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: gridColor,
        appBar: AppBar(
          leading: Builder(
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
            },),


          backgroundColor: Colors.white,

          elevation: 0.0,
          title: SizedBox(
              height: 60.h,
              width: 60.w,
              child: SvgPicture.asset('assets/images/logo.svg',)),

          centerTitle: true,
          actions: [
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 24.w,end: 24.w),
              child: InkWell(
                  onTap: ()
                  {
                    navigateTo(context, const NotificationScreen());
                  },
                  child: SvgPicture.asset('assets/images/Notifications.svg',width: 32.w)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 24.w),
              child: InkWell(
                  onTap: () {
                    navigateTo(context, const ShoppingCar());
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
                    'sara elgamal'),
                accountEmail: Text(
                  'sara@gmail.com'),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                       'https://cdn-icons-png.flaticon.com/512/3177/3177440.png')),


              ),
//                   InkWellWidget(icon: Icons.speed_outlined, text: S.of(context).controlPage, onTap: () {
// navigateTo(context, const ControlPage());
//                   }),


              InkWellWidget(
                  icon: Icons.person, text: S
                  .of(context)
                  .profile, onTap: () {
                navigateTo(context, MyProfile(isReverse: true));
              }),
              InkWellWidget(icon: Icons.shopping_cart, text: S
                  .of(context)
                  .orders, onTap: () {
                navigateTo(
                    context, MyOrdersScreen(isReverse: true));
              }),
              InkWellWidget(icon: Icons.favorite, text: S
                  .of(context)
                  .favorite, onTap: () {
                navigateTo(
                    context, FavoriteScreen(isReverse: true,));
              }),
              InkWellWidget(icon: Icons.home_filled, text: S
                  .of(context)
                  .Addresses, onTap: () {
                navigateTo(context, const AllAddresses());
              }),

              // InkWellWidget(icon: Icons.language, text: S
              //     .of(context)
              //     .language, onTap: () {
              //   _showLanguageMenu(context);
              // }),

              InkWellWidget(icon: Icons.logout, text: S
                  .of(context)
                  .logOut,
                onTap: () async
                {
                  await CacheHelper.clearAll().then((value) {
                    value = true;
                    if (value) {
                      navigateTo(context, LoginScreen());
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
                       SizedBox(height: 50.h,),
                       GridView.count(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         mainAxisSpacing: 15.0,
                         crossAxisSpacing: 15.0,

                         crossAxisCount: 2, //number of them
                         children:
                         List.generate(
                           6,
                               (index) =>
                               InkWell(
                                   onTap: ()
                                   {
                                   navigateTo(context,  SubCategoryScreen(index) );
                                   },
                                   child: catBuilder()),
                         ),
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
      ),
    );
  }
  Widget catBuilder () => Stack(
    children: [
      Container(
        height: 200.h,
        width: 170.w,
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
          child: Center(child: Image.network('https://images-eu.ssl-images-amazon.com/images/I/51wmd3ANYRL._AC_UL600_SR600,400_.jpg',height: 96.5.h,))),


      Positioned(
        top: 120.0.h,
        right: 27.0.w,
        left: 23.0.w,
        bottom: 0.h,
        child: Text(


          'بنطلون مستورد',style: GoogleFonts.cairo(

          fontSize: 14.sp,

          color: SecondColor,
          fontWeight: FontWeight.w600,

        ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

        ),
      ),
    ],
  );
}
