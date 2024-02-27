
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/orders/logic/states.dart';

class OrdersCubit extends Cubit<OrdersStates> {


  OrdersCubit() : super(InitialStateOrders());


  static OrdersCubit get(context) => BlocProvider.of(context);




}
