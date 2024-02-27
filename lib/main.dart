import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/Splash_screen.dart';
import 'core/constant/const/const.dart';
import 'core/data_base/cache_helper/cache_helper.dart';
import 'features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'features/create_order_logic/create_order_cubit.dart';
import 'features/home_page/Products/logic/cubit.dart';
import 'features/logic/cubit.dart';
import 'features/logic/states.dart';
import 'features/orders/logic/cubit.dart';
import 'features/postAddress/postAddress_cubit.dart';
import 'features/update_profile/update_profile_logic/update_profile_cubit.dart';
import 'generated/l10n.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  await CacheHelper.init();
  idUser = CacheHelper.getData(key: 'idUser');
print(idUser);
  nameUser = CacheHelper.getData(key: 'nameUser');
  phoneUser = CacheHelper.getData(key: 'phoneUser');
  emailUser = CacheHelper.getData(key: 'emailUser');
  dateUser = CacheHelper.getData(key: 'dateUser');
  imageUser = CacheHelper.getData(key: 'imageUser');
  print(idUser);
  print(nameUser);
  print(phoneUser);
  print(emailUser);
  print(dateUser);
  print(imageUser);
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
            create: (context) => AppCubit(),

          ),

          BlocProvider(
            create: (context) => ProductsCubit(),

          ),
          BlocProvider(
            create: (context) => AddressCubit(),

          ),
          BlocProvider(
            create: (context) => OrdersCubit(),

          ),

          BlocProvider(
            create: (context) => CreateOrderCubit(),

          ),


          BlocProvider(
            create: (context) => CardCubit()

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
          textTheme: TextTheme(
            titleMedium: GoogleFonts.cairo(
              fontSize: 16.sp,
            ),
          ),
        ),
        home:    SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),),
    );
     }
    );
  }
  }


