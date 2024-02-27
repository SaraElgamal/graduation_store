




import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/toast.dart';
import 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateStates> {


  CreateOrderCubit() : super(InitialStateCreate());


  static CreateOrderCubit get(context) => BlocProvider.of(context);


}