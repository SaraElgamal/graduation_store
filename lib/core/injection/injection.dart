

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_cubit.dart';
import '../../features/home_page/Products/logic/cubit.dart';
import '../../features/logic/cubit.dart';
import '../../features/logic/repo.dart';
import '../web_services/web_services.dart';

final getIt = GetIt.instance;

void getInit() {
  getIt.registerLazySingleton<WebServices> (() => WebServices(createSetupDio()));
  getIt.registerLazySingleton<AppCubit> (() => AppCubit(getIt()));
  getIt.registerLazySingleton<Repository> (() => Repository(getIt()));

  getIt.registerLazySingleton<ProductsCubit> (() => ProductsCubit(getIt()));
  getIt.registerLazySingleton<CardCubit> (() => CardCubit(getIt()));



}
Dio createSetupDio()
{
  Dio dio = Dio () ;

  dio.interceptors.add(LogInterceptor(
    error: true ,
    request: true,
    requestHeader: false ,
    responseBody: true,
    requestBody: true,
    responseHeader: false,


  ));
  dio.options.followRedirects = false;
  dio.options.validateStatus =
      (status) => status != null &&  status < 400;
  dio.options.maxRedirects = 0;



  return dio;
}