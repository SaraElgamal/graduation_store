import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/postAddress/postAddress_state.dart';

import '../../core/utils/toast.dart';
import '../orders/add_address/add_address_model.dart';


class AddressCubit extends Cubit<PostAddressStates> {

  AddressCubit() : super(InitialPostAddressState());

  static AddressCubit get(context) => BlocProvider.of(context);

//   postAddress(context,{
//     required int user_id,
//     required String full_name,
//     required String phone_number,
//     required String city,
//     required String address_line1,
//     required String notes,
//     required String phone2,
//     required String postal_code,
//     required String region,
//     required String district,
//   }) async {
//     emit(PostLoadingAddAddressStateOrders());
//
//     try {
//       // dynamic response =
//       await repoAddress.addAddress(DataAddress(
//         user_id: user_id,
//         full_name: full_name,
//         phone_number: phone_number,
//         city: city,
//         address_line1: address_line1,
//         postal_code: postal_code,
//         region: region,
//         district: district,
//         phone_number2: phone2,
//         notes: notes,
//       ));
//
//       // print("before success");
//       emit(PostSuccessAddAddressStateOrders());
//       showToast(text: 'تمت إضافة العنوان بنجاح', state: ToastStates.success);
//      OrdersCubit.get(context).getAddressById(user_id: idUser!.toInt());
//
//       //
//       // if (response is Map<String, dynamic>) {
//       //   // Assuming success response is a Map<String, dynamic>
//       //   print("success");
//       //
//       //   // Process the map response if needed
//       //   // Example: String message = response['message'];
//       //
//       // } else {
//       //   // Handle unexpected response type
//       //
//       //   print("Unexpected response type: $response");
//       //   print("Unexpected response type: ${response.runtimeType}");
//       //   print(response.toJson());
//       //   emit(PostErrorAddAddressStateOrders());
//       //
//       // }
//     } catch (error) {
//       // print("before error");
//       emit(PostErrorAddAddressStateOrders());
//       // print(error);
//       showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//     }
//   }
//
// // postAddress({
//   //   required int user_id,
//   //   required String full_name,
//   //   required String phone_number,
//   //   required String city,
//   //   required String address_line1,
//   //
//   //   required String notes,
//   //   required String phone2,
//   //   required String postal_code,
//   //   required String region,
//   //   required String district,
//   //
//   // }) async {
//   //   emit( PostLoadingAddAddressStateOrders() );
//   //   await repoAddress.addAddress(DataAddress(
//   //
//   //       user_id: user_id,
//   //       full_name: full_name,
//   //       phone_number: phone_number,
//   //       city: city,
//   //       address_line1: address_line1,
//   //       postal_code: postal_code,
//   //       region: region,
//   //       district: district,
//   //       phone_number2: phone2,
//   //       notes: notes
//   //
//   //
//   //   ))
//   //   .then((dynamic response) {
//   //     print("before success");
//   //
//   //     if (response is Map<String, dynamic>) {
//   //       // Assuming success response is a Map<String, dynamic>
//   //       emit(PostSuccessAddAddressStateOrders());
//   //       print("success");
//   //     }
//   //     else {
//   //       // Handle unexpected response type
//   //       print("Unexpected response type: $response");
//   //       emit(PostErrorAddAddressStateOrders());
//   //     }
//   //
//   //   })
//   //   .catchError((error) {
//   //     print("before error");
//   //     emit(PostErrorAddAddressStateOrders());
//   //     print(error);
//   //   });
//     //     .then((value) {
//     //   print("before success");
//     //
//     // emit(PostSuccessAddAddressStateOrders());
//     // print("success");
//     // // showToast(text: 'تمت إضافة العنوان بنجاح', state: ToastStates.success);
//     //
//     // }).catchError((error) {
//     //   print("before error");
//     //
//     //   emit( PostErrorAddAddressStateOrders() );
//     //   print(error);
//     // // showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//     //
//     // });
//   // }

}