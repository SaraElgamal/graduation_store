import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';

import '../../../core/utils/toast.dart';
import '../../card/card_model/card_model.dart';

class CardCubit extends Cubit<ShoppingStates> {


  CardCubit() : super(InitialShoppingState());

  static CardCubit get(context) => BlocProvider.of(context);

//   addInCard({
//     required String productId,
//     required String quantity,
//     required String price,
//     required String userId,
//   }) async
//   {
//     emit(PostLoadingCardState());
//     await repoCard.addCardItem(
//       CardItemsRequest(
//         user_id: userId,
//         product_id: productId,
//         quantity: quantity,
//         price: price,
//       ),
//
//     ).then((value) {
//
//
//       if(value.message == 'المنتج مضاف من قبل') {
//         showToast
//           (
//             text: 'المنتج مضاف من قبل',
//             state: ToastStates.white
//         );
//       }
// else {
//         showToast(text: 'تم إضافة المنتج إلى عربة التسوق بنجاح',
//             state: ToastStates.success);
//       }
// emit(PostSuccessCardState());
//       getUserCard(userId: idUser.toString());
//
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//       emit(PostErrorCardState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//   List<CartItemsData>? cardProducts = [];
//   getUserCard({required String userId}) async
//   {
//     emit(PostLoadingGetCardState());
//     await repoCard.getCardItem(
//       userId,
//
//     ).then((value) {
//       cardProducts = value.cartItems;
//
//       // if(value.message != null) {
//       //  showToast(text: 'تم إضافة المنتج إلى المفضلة بنجاح', state: ToastStates.success);
//
//       emit(PostSuccessGetCardState());
//
//       // }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ حاول مجددا', state: ToastStates.error);
//
//       emit(PostErrorGetCardState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }
//
//   deleteFromCard({
//     required String cardId,
//   }) async
//   {
//     emit(PostLoadingDeleteCardState());
//     await repoCard.deleteCardItem(
//         cardId
//
//     ).then((value) {
//       if(value.msg != null) {
//         showToast(text: value.msg.toString(), state: ToastStates.success);
//
//         emit(PostSuccessDeleteCardState());
//         getUserCard(userId: idUser.toString());
//       }
//     }).catchError((onError)
//     {
//       showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);
//
//       emit(PostErrorDeleteCardState());
//       debugPrint('errrrrror ${onError.toString()}');
//
//     });
//
//   }

}