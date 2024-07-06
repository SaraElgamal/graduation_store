import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/ShoppingCar/shopping_logic/shopping_logic_state.dart';
import 'package:graduation_project/features/home_page/Products/logic/cubit.dart';

import '../../../core/constant/end_points/end_point.dart';
import '../../../core/utils/toast.dart';
import '../../auth/models/login_model.dart';
import '../../logic/repo.dart';


class CardCubit extends Cubit<ShoppingStates> {
  Repository repo;
  CardCubit(this.repo) : super(InitialShoppingState());

  static CardCubit get(context) => BlocProvider.of(context);

  addInCard(context,{
    required String productId,
    required String imageOfProduct,
    required String color,
    required String priceAfterDiscount,
    required String size,
    required String name,
    required String detailsId,
  }) async {
    emit(PostLoadingCardState());
    await repo
        .addToCart(
      productId:
            productId,
            add:
            AddToCartModelRequest(
              imageOfProduct: imageOfProduct,
              color: color,
              priceAfterDiscount: priceAfterDiscount,
              size: size,
              detailsId: detailsId,
            ))
        .then((value) {

      if (value.status == "success") {
        showToast(
            text: 'تم إضافة المنتج إلى عربة التسوق بنجاح',
            state: ToastStates.success);

        emit(PostSuccessCardState());
        getUserCard();
        ProductsCubit.get(context).getAllProductsFun();

        products!.add(ProductsPayment(
          id: productId,
          image: imageOfProduct,
         name: name,
          price: int.parse(priceAfterDiscount),

        ));
      }
    }).catchError((onError) {
      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(PostErrorCardState());
      log('errrrrror ${onError.toString()}');
    });
  }

  List<ProductsDetailsForCartModel>? cardProducts = [];
  getUserCard() async {
    emit(GetLoadingCardState());
    await repo.getCart().then((value) {
      cardProducts = value.data!.products;


      emit(GetSuccessCardState());

      // }
    }).catchError((onError) {
      showToast(text: 'عفوا حدث خطأ حاول مجددا', state: ToastStates.error);

      emit(GetErrorCardState());
      log('errrrrror ${onError.toString()}');
    });
  }

  deleteFromCard(context,{
    required String cardId,
    required String productId,
  }) async
  {
    emit(DeleteLoadingCardState());
    await repo.deleteFromCart(
       cardId,
        productId

    ).then((value) {
      showToast(text: 'تم الحذف', state: ToastStates.success);

      emit(DeleteSuccessCardState());
      getUserCard();
      ProductsCubit.get(context).getAllProductsFun();

    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(DeleteErrorCardState());
      log('errrrrror ${onError.toString()}');
      log(cardId);
      log(productId);

    });

  }

  deleteAllCard(context) async
  {
    emit(DeleteAllLoadingCardState());
    await repo.deleteAllCart()
.then((value) {
      showToast(text: 'تم الحذف', state: ToastStates.success);

      emit(DeleteAllSuccessCardState());
      getUserCard();
      ProductsCubit.get(context).getAllProductsFun();

    }).catchError((onError)
    {
      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(DeleteAllErrorCardState());
      log('errrrrror ${onError.toString()}');

    });

  }


  String? url ;
  List<ProductsPayment>? products = [];
  paymentFun() async {
    emit(PostLoadingPaymentState());
    await repo
        .getPayment(

    PaymentRequestModel(
     products: products

    )
    )
        .then((value) {

      if (value.status == "success") {
     url =  value.session!.url.toString();

        emit(PostSuccessPaymentState());

      }
    }).catchError((onError) {
      showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      emit(PostErrorPaymentState());
      log('errrrrror ${onError.toString()}');
    });
  }

  String? imageFinallyUrl;
  Future<void> uploadImage(File imageFile, String clothUrl) async {
    Dio dio = Dio();
    String apiUrl = 'http://10.0.2.2:4000/products/tryClothes';
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path,
          filename: imageFile.path.split('/').last),
      'cloth_url': clothUrl,
    });try {Response response = await dio.post(apiUrl, data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
          maxRedirects: 0,
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': '*/*',
            'Content-Type': 'multipart/form-data',},),);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        imageFinallyUrl = response.data['url'];
        emit(SuccessProcessing());
        print('Image URL: $imageFinallyUrl');
        print(response.data);
      } else {print('Image upload failed');}} catch (e) {print('Error: $e');
    }}}
