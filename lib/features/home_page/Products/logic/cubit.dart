
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home_page/Products/logic/states.dart';

class ProductsCubit extends Cubit<ProductStates> {

  ProductsCubit() : super(InitialStateProduct());


  static ProductsCubit get(context) => BlocProvider.of(context);




}