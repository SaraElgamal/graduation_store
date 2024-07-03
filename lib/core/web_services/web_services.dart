

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../features/auth/models/login_model.dart';


part 'web_services.g.dart';

@RestApi(baseUrl: ('https://shopping-gp-2b5338c8c372.herokuapp.com/'))

abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @POST('users/login')
  Future<LoginModel> loginSales (@Body() LoginModelRequest  login) ;


  @POST('users/signup')
  Future<LoginModel> signUp (@Body() SignUpModelRequest  signUp) ;

  @POST('products')
  Future<CreateProducts> addProducts (
      @Header('Authorization') String token ,
      @Body() CreateProductsRequest  create) ;


  @GET('users/me')
  Future<UpdateProfileModel> updateMe (@Header('Authorization') String token) ;

  @GET('users')
  Future<AllUsersModel> AllUsers ( @Header('Authorization') String token,) ;


  @GET('products')
  Future<GetAllProductsModel> getAllProducts (@Body() UserId  user) ;
  
  @DELETE('products/{id}')
  Future deleteProduct (
      @Header('Authorization') String token,

      @Path('id') String productId
      ) ;


  @DELETE('details/{id}')
  Future deleteDetail (
  @Header('Authorization') String token,
  @Path('id') String detailId
      ) ;


  @DELETE('users/{id}')
  Future deleteUsers (
      @Header('Authorization') String token,

      @Path('id') String userId
      ) ;

  @DELETE('cart/{cartId}/{productId}')
  Future deleteFromCart (
      @Header('Authorization') String token,
      @Path('cartId') String cartId,
      @Path('productId') String productId,
      ) ;


  @DELETE('cart')
  Future deleteAllCart (
      @Header('Authorization') String token,
      ) ;

  @POST('cart/{productId}')
  Future<AddToCartModel> addToCart (
      @Header('Authorization') String token ,
      @Path('productId') String productId,
      @Body()  AddToCartModelRequest add) ;




  @GET('cart')
  Future<GetCartModel> getCart (
      @Header('Authorization') String token ,
    ) ;


  @GET('bookings/checkout-session')
  Future<PaymentModel> getPayment (
      @Header('Authorization') String token ,
      @Body()  PaymentRequestModel add

      ) ;



  @POST('favorites/addToFavorites/{productId}')
  Future<AddToFavModel> addToFav (
      @Header('Authorization') String token ,
      @Path('productId') String productId,
     ) ;

  @DELETE('favorites/deleteOne/{productId}')
  Future deleteFromFav (
      @Header('Authorization') String token,
      @Path('productId') String productId,
      ) ;


  @DELETE('favorites/deleteAll')
  Future deleteAllFav (
      @Header('Authorization') String token,
      ) ;



  @GET('favorites/getFavorites')
  Future<GetFavModel> getFavorites (
      @Header('Authorization') String token ,

      ) ;
}


