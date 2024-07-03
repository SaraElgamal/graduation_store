

import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';


@JsonSerializable()
class LoginModel {
  String? status;
  String? token;
  DataLogin? data;

  LoginModel({this.status, this.token, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);


}
@JsonSerializable()
class DataLogin {
  User? user;

  DataLogin({this.user});


  factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginToJson(this);

}

@JsonSerializable()
class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? file;
  String? role;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  User({this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.file,
    this.role,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.id});


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}

@JsonSerializable()
class LoginModelRequest {
  String? email;
  String? password;

  LoginModelRequest({this.email, this.password});

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) => _$LoginModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelRequestToJson(this);

}

@JsonSerializable()
class SignUpModelRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? phone;
  String? password;
  String? passwordConfirm;

  SignUpModelRequest({this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.passwordConfirm});

  factory SignUpModelRequest.fromJson(Map<String, dynamic> json) => _$SignUpModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelRequestToJson(this);


}

@JsonSerializable()
class CreateProducts {
  String? status;
  DataProducts? data;

  CreateProducts({this.status, this.data});

  factory CreateProducts.fromJson(Map<String, dynamic> json) => _$CreateProductsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductsToJson(this);

}

@JsonSerializable()
class DataProducts {
  DataProductsDetails? data;

  DataProducts({this.data});

  factory DataProducts.fromJson(Map<String, dynamic> json) => _$DataProductsFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductsToJson(this);

}

@JsonSerializable()
class DataProductsDetails {
  String? name;
  String? description;
  String? category;
  String? typeOfCloth;
  num? price;
  int? discount;
  List<Details>? details;
  List<String>? favorites;
  int? allQuantity;
  bool? favorite;
  String? productOwner;
  String? brand;
  String? sId;
  int? iV;
  num? priceAfterDiscount;
  String? id;

  DataProductsDetails(
      {this.name,
    this.description,
    this.category,
    this.typeOfCloth,
    this.price,
    this.productOwner,
    this.favorite,
    this.discount,
    this.details,
    this.favorites,
    this.allQuantity,
    this.brand,
    this.sId,
    this.iV,
    this.priceAfterDiscount,
    this.id});
  factory DataProductsDetails.fromJson(Map<String, dynamic> json) => _$DataProductsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductsDetailsToJson(this);

}

@JsonSerializable()
class UserId {
  String? userId;

  UserId({this.userId});
  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);


}
@JsonSerializable()
class CreateProductsRequest {
  String? name;
  String? description;
  String? price;
  String? discount;
  String? brand;
  String? category;
  String? typeOfCloth;

  CreateProductsRequest({this.name,
    this.description,
    this.price,
    this.discount,
    this.brand,
    this.category,
    this.typeOfCloth});
  factory CreateProductsRequest.fromJson(Map<String, dynamic> json) => _$CreateProductsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductsRequestToJson(this);

}

@JsonSerializable()
class UpdateProfileModel {
  String? status;
  DataUpdateProfile? data;

  UpdateProfileModel({this.status, this.data});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileModelToJson(this);


}

@JsonSerializable()
class DataUpdateProfile {
  DataUpdateProfileDetail? data;

  DataUpdateProfile({this.data});

  factory DataUpdateProfile.fromJson(Map<String, dynamic> json) => _$DataUpdateProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataUpdateProfileToJson(this);


}

@JsonSerializable()
class DataUpdateProfileDetail {
  String? file;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? phone;
  bool? rememberMe;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  DataUpdateProfileDetail({this.file,
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.phone,
    this.rememberMe,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.id});

  factory DataUpdateProfileDetail.fromJson(Map<String, dynamic> json) => _$DataUpdateProfileDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DataUpdateProfileDetailToJson(this);


}


@JsonSerializable()
class AllUsersModel {
  String? status;
  int? totalPages;
  int? results;
  DataAllUsers? data;

  AllUsersModel({this.status, this.totalPages, this.results, this.data});

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => _$AllUsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllUsersModelToJson(this);

}
@JsonSerializable()
class DataAllUsers {
  List<DataAllUsersInDetails>? data;

  DataAllUsers({this.data});
  factory DataAllUsers.fromJson(Map<String, dynamic> json) => _$DataAllUsersFromJson(json);

  Map<String, dynamic> toJson() => _$DataAllUsersToJson(this);

}
@JsonSerializable()
class DataAllUsersInDetails {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? file;
  String? role;
  String? phone;
  List<String>? products;
  bool? rememberMe;
  String? createdAt;
  String? updatedAt;
  String? id;

  DataAllUsersInDetails({this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.file,
    this.role,
    this.phone,
    this.products,
    this.rememberMe,
    this.createdAt,
    this.updatedAt,
    this.id});


  factory DataAllUsersInDetails.fromJson(Map<String, dynamic> json) => _$DataAllUsersInDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DataAllUsersInDetailsToJson(this);


}







@JsonSerializable()
class GetAllProductsModel {
  String? status;
  List<DataAll>? data;

  GetAllProductsModel({this.status, this.data});

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) => _$GetAllProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsModelToJson(this);

}
@JsonSerializable()
class DataAll {
  String? category;
  int? totalDocs;
  int? totalPages;
  List<DataProductsDetails>? products;

  DataAll({this.category, this.totalDocs, this.totalPages, this.products});

  factory DataAll.fromJson(Map<String, dynamic> json) => _$DataAllFromJson(json);

  Map<String, dynamic> toJson() => _$DataAllToJson(this);

}
@JsonSerializable()
class Details {
  String? sId;
  String? color;
  String? file;
  List<Sizes>? sizes;
  String? id;

  Details({this.sId, this.color, this.file, this.sizes, this.id});

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);

}
@JsonSerializable()
class Sizes {
  String? size;
  int? quantity;
  String? sId;
  String? id;

  Sizes({this.size, this.quantity, this.sId, this.id});
  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Map<String, dynamic> toJson() => _$SizesToJson(this);

}
@JsonSerializable()
class AddToCartModel {
  String? status;
  DataAddToCart? data;

  AddToCartModel({this.status, this.data});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => _$AddToCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartModelToJson(this);

}

@JsonSerializable()
class DataAddToCart {
  DataAddToCartDetails? data;

  DataAddToCart({this.data});

  factory DataAddToCart.fromJson(Map<String, dynamic> json) => _$DataAddToCartFromJson(json);

  Map<String, dynamic> toJson() => _$DataAddToCartToJson(this);

}


@JsonSerializable()
class DataAddToCartDetails {
  String? product;
  String? user;
  int? priceAfterDiscount;
  String? color;
  String? size;
  String? imageOfProduct;
  String? sId;
  int? iV;
  String? id;

  DataAddToCartDetails({this.product,
    this.user,
    this.priceAfterDiscount,
    this.color,
    this.size,
    this.imageOfProduct,
    this.sId,
    this.iV,
    this.id});


  factory DataAddToCartDetails.fromJson(Map<String, dynamic> json) => _$DataAddToCartDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DataAddToCartDetailsToJson(this);


}

@JsonSerializable()

class AddToCartModelRequest {
  String? imageOfProduct;
  String? size;
  String? color;
  String? priceAfterDiscount;
  String? detailsId;

  AddToCartModelRequest(
      {this.imageOfProduct, this.detailsId ,this.size, this.color, this.priceAfterDiscount});

  factory AddToCartModelRequest.fromJson(Map<String, dynamic> json) => _$AddToCartModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartModelRequestToJson(this);


}
@JsonSerializable()
class GetCartModel {
  String? status;
  int? results;
  DataGetCart? data;

  GetCartModel({this.status, this.results, this.data});

  factory GetCartModel.fromJson(Map<String, dynamic> json) => _$GetCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartModelToJson(this);

}
@JsonSerializable()
class DataGetCart {
  List<ProductsDetailsForCartModel>? products;

  DataGetCart({this.products});
  factory DataGetCart.fromJson(Map<String, dynamic> json) => _$DataGetCartFromJson(json);

  Map<String, dynamic> toJson() => _$DataGetCartToJson(this);

}
@JsonSerializable()
class ProductsDetailsForCartModel {
  String? sId;
  ProductCartModel? product;
  String? user;
  int? priceAfterDiscount;
  String? color;
  String? size;
  String? imageOfProduct;
  int? iV;
  String? id;

  ProductsDetailsForCartModel({this.sId,
    this.product,
    this.user,
    this.priceAfterDiscount,
    this.color,
    this.size,
    this.imageOfProduct,
    this.iV,
    this.id});
  factory ProductsDetailsForCartModel.fromJson(Map<String, dynamic> json) => _$ProductsDetailsForCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDetailsForCartModelToJson(this);

}
@JsonSerializable()
class ProductCartModel {
  String? sId;
  String? name;
  String? brand;
  String? id;

  ProductCartModel({this.sId, this.name, this.brand, this.id});

  factory ProductCartModel.fromJson(Map<String, dynamic> json) => _$ProductCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartModelToJson(this);

}

@JsonSerializable()

class PaymentRequestModel {
  List<ProductsPayment>? products;

  PaymentRequestModel({this.products});
  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => _$PaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestModelToJson(this);

}

@JsonSerializable()

class ProductsPayment {
  String? name;
  String? id;
  int? price;
  String? image;

  ProductsPayment({this.name, this.id, this.price, this.image});

  factory ProductsPayment.fromJson(Map<String, dynamic> json) => _$ProductsPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsPaymentToJson(this);

}

@JsonSerializable()
class PaymentModel {
  String? status;
  Session? session;

  PaymentModel({this.status, this.session});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

}


@JsonSerializable()
class Session {
  String? id;
  String? object;


  int? amountSubtotal;
  int? amountTotal;
  AutomaticTax? automaticTax;

  String? cancelUrl;
  String? clientReferenceId;

  int? created;
  String? currency;

  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;
  int? expiresAt;

  InvoiceCreation? invoiceCreation;
  bool? livemode;


  String? mode;

  String? paymentMethodCollection;


  List<String>? paymentMethodTypes;
  String? paymentStatus;

  String? status;

  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;

  Session(
      {this.id, this.object,
         this.amountSubtotal, this.amountTotal,
        this.automaticTax,  this.cancelUrl, this.clientReferenceId,
     this.created, this.currency,
  this.customerCreation, this.customerDetails,
        this.customerEmail, this.expiresAt, this.invoiceCreation,
        this.livemode, this.mode,  this.paymentMethodCollection,
         this.paymentMethodTypes, this.paymentStatus,
 this.status, this.successUrl, this.totalDetails, this.uiMode,
        this.url});

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

}

@JsonSerializable()
class AutomaticTax {
  bool? enabled;


  AutomaticTax({this.enabled, });
  factory AutomaticTax.fromJson(Map<String, dynamic> json) => _$AutomaticTaxFromJson(json);

  Map<String, dynamic> toJson() => _$AutomaticTaxToJson(this);

}

@JsonSerializable()
class CustomerDetails {

  String? email;

  String? taxExempt;


  CustomerDetails(
      { this.email, this.taxExempt, });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => _$CustomerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);

}

@JsonSerializable()
class InvoiceCreation {
  bool? enabled;

  InvoiceCreation({this.enabled, });


  factory InvoiceCreation.fromJson(Map<String, dynamic> json) => _$InvoiceCreationFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceCreationToJson(this);

}

@JsonSerializable()
class TotalDetails {
  int? amountDiscount;
  int? amountShipping;
  int? amountTax;

  TotalDetails({this.amountDiscount, this.amountShipping, this.amountTax});
  factory TotalDetails.fromJson(Map<String, dynamic> json) => _$TotalDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDetailsToJson(this);

}

@JsonSerializable()
class AddToFavModel {
  String? status;
  String? message;

  AddToFavModel({this.status, this.message});

  factory AddToFavModel.fromJson(Map<String, dynamic> json) => _$AddToFavModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToFavModelToJson(this);

}

@JsonSerializable()
class GetFavModel {
  String? status;
  int? totalPages;
  int? results;
  DataFav? data;

  GetFavModel({this.status, this.totalPages, this.results, this.data});
  factory GetFavModel.fromJson(Map<String, dynamic> json) => _$GetFavModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavModelToJson(this);

}

@JsonSerializable()
class DataFav {
  List<DataProductsDetails>? data;

  DataFav({this.data});
  factory DataFav.fromJson(Map<String, dynamic> json) => _$DataFavFromJson(json);

  Map<String, dynamic> toJson() => _$DataFavToJson(this);

}
