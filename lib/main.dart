import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constant/end_points/end_point.dart';
import 'package:graduation_project/features/Splash_screen.dart';
import 'package:graduation_project/features/admin/create_products/create_product.dart';
import 'package:graduation_project/features/auth/login/presentation/login.dart';
import 'core/constant/const/const.dart';
import 'core/data_base/cache_helper/cache_helper.dart';
import 'core/injection/injection.dart';
import 'features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'features/create_order_logic/create_order_cubit.dart';
import 'features/home_page/Products/logic/cubit.dart';
import 'features/logic/cubit.dart';
import 'features/logic/states.dart';
import 'features/postAddress/postAddress_cubit.dart';
import 'features/update_profile/update_profile_logic/update_profile_cubit.dart';
import 'generated/l10n.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  getInit();
  runApp(const MyApp());
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
print(token);

  role = CacheHelper.getData(key: 'roleLogin');
  print(role);

  emailUser = CacheHelper.getData(key: 'email');
  photo = CacheHelper.getData(key: 'photo');
  nameF = CacheHelper.getData(key: 'nameF');
  nameL = CacheHelper.getData(key: 'nameL');
  userId = CacheHelper.getData(key: 'userId');
  print(emailUser);
  print(photo);
  print(userId);
  print(nameF);
  print(nameL);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(
        390,
        844
    ),
    minTextAdapt: true,
    splitScreenMode: true,
    builder:(context, child) {

    return  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>  getIt<AppCubit>(),

          ),

          BlocProvider(
            create: (context) => getIt<ProductsCubit>()..getAllProductsFun(),

          ),

          BlocProvider(
              create: (context) => getIt<CardCubit>()

          ),
          BlocProvider(
            create: (context) => AddressCubit(),

          ),


          BlocProvider(
            create: (context) => CreateOrderCubit(),

          ),





          BlocProvider(
            create: (context) => ProfileUserCubit(),

          ),






        ],

    child :  BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) => MaterialApp(

        locale:
        AppCubit.get(context).isArabicSelected ? const Locale('ar') : const Locale('en'),

        //: const Locale('en'),
        localizationsDelegates: const [

          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
fontFamily: GoogleFonts.cairo().fontFamily,
          primarySwatch: Colors.deepOrange,

//           colorScheme: ColorScheme.fromSeed(
//             primary: primaryColor ,
//             seedColor: primaryColor,
// background: Colors.white,
//
//
//
//           ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white,foregroundColor: Colors.white,shadowColor: Colors.white),
          textTheme: TextTheme(
            titleMedium: GoogleFonts.cairo(
              fontSize: 16.sp,
            ),
          ),
        ),
        home:  const  SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),),
    );
     }
    );
  }
  }


