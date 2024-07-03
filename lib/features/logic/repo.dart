

import 'dart:developer';

import 'package:graduation_project/core/constant/end_points/end_point.dart';

import '../../../core/web_services/web_services.dart';
import '../auth/models/login_model.dart';

class Repository {
  final WebServices webServices;

  Repository(this.webServices);

  Future<LoginModel> loginSales (LoginModelRequest login) async
  {
    return  await webServices.loginSales(login);

  }


  Future<LoginModel> signUp (SignUpModelRequest signUp) async
  {
    return  await webServices.signUp(signUp);

  }

  Future<CreateProducts> addProducts ( CreateProductsRequest  create) async
  {
    return  await webServices.addProducts('Bearer $token',create);
  }



  Future<UpdateProfileModel> updateMe () async
  {
    return  await webServices.updateMe('Bearer $token');
  }

  Future<AllUsersModel> AllUsers () async
  {
    return  await webServices.AllUsers('Bearer $token');
  }


  Future<GetAllProductsModel> getAllProducts (UserId  user) async
  {
    return  await webServices.getAllProducts(user);
  }

  Future deleteUsers (String userId) async
  {
    return  await webServices.deleteUsers('Bearer $token',userId);
  }

  Future deleteProduct (String productId) async
  {
    return  await webServices.deleteProduct('Bearer $token',productId);
  }

  Future deleteDetails (String detailId) async
  {
    return  await webServices.deleteDetail('Bearer $token',detailId);
  }

  Future<AddToCartModel> addToCart ({required String productId, required AddToCartModelRequest add}) async
  {
    return  await webServices.addToCart('Bearer $token',productId,add);
  }

  Future<GetCartModel> getCart () async
  {
    return  await webServices.getCart('Bearer $token');
  }

  Future deleteFromCart (String cartId,String productId) async
  {

    return  await webServices.
    deleteFromCart('Bearer $token',cartId,productId);
  }

  Future deleteAllCart () async
  {
    return  await webServices.deleteAllCart('Bearer $token');
  }

  Future<PaymentModel> getPayment (

    PaymentRequestModel add

      ) async {
    return  await webServices.getPayment('Bearer $token', add);

  }

  Future<AddToFavModel> addToFav (
      String productId
      ) async {
    return  await webServices.addToFav('Bearer $token', productId);

  }

  Future deleteFromFav (

       String productId,
      ) async {
    return  await webServices.deleteFromFav('Bearer $token', productId);

  }
  Future deleteAllFav (
      ) async {
    return  await webServices.deleteAllFav('Bearer $token');

  }
  Future<GetFavModel> getFavorites () async
  {
    return  await webServices.getFavorites('Bearer $token');

  }

}