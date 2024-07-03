// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'data': instance.data,
    };

DataLogin _$DataLoginFromJson(Map<String, dynamic> json) => DataLogin(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataLoginToJson(DataLogin instance) => <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['sId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      file: json['file'] as String?,
      role: json['role'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.sId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'file': instance.file,
      'role': instance.role,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'id': instance.id,
    };

LoginModelRequest _$LoginModelRequestFromJson(Map<String, dynamic> json) =>
    LoginModelRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginModelRequestToJson(LoginModelRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SignUpModelRequest _$SignUpModelRequestFromJson(Map<String, dynamic> json) =>
    SignUpModelRequest(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      passwordConfirm: json['passwordConfirm'] as String?,
    );

Map<String, dynamic> _$SignUpModelRequestToJson(SignUpModelRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
    };

CreateProducts _$CreateProductsFromJson(Map<String, dynamic> json) =>
    CreateProducts(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DataProducts.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProductsToJson(CreateProducts instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataProducts _$DataProductsFromJson(Map<String, dynamic> json) => DataProducts(
      data: json['data'] == null
          ? null
          : DataProductsDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProductsToJson(DataProducts instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataProductsDetails _$DataProductsDetailsFromJson(Map<String, dynamic> json) =>
    DataProductsDetails(
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      typeOfCloth: json['typeOfCloth'] as String?,
      price: json['price'] as num?,
      productOwner: json['productOwner'] as String?,
      favorite: json['favorite'] as bool?,
      discount: json['discount'] as int?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allQuantity: json['allQuantity'] as int?,
      brand: json['brand'] as String?,
      sId: json['sId'] as String?,
      iV: json['iV'] as int?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataProductsDetailsToJson(
        DataProductsDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'typeOfCloth': instance.typeOfCloth,
      'price': instance.price,
      'discount': instance.discount,
      'details': instance.details,
      'favorites': instance.favorites,
      'allQuantity': instance.allQuantity,
      'favorite': instance.favorite,
      'productOwner': instance.productOwner,
      'brand': instance.brand,
      'sId': instance.sId,
      'iV': instance.iV,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'id': instance.id,
    };

UserId _$UserIdFromJson(Map<String, dynamic> json) => UserId(
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserIdToJson(UserId instance) => <String, dynamic>{
      'userId': instance.userId,
    };

CreateProductsRequest _$CreateProductsRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProductsRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      discount: json['discount'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      typeOfCloth: json['typeOfCloth'] as String?,
    );

Map<String, dynamic> _$CreateProductsRequestToJson(
        CreateProductsRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'brand': instance.brand,
      'category': instance.category,
      'typeOfCloth': instance.typeOfCloth,
    };

UpdateProfileModel _$UpdateProfileModelFromJson(Map<String, dynamic> json) =>
    UpdateProfileModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DataUpdateProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileModelToJson(UpdateProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataUpdateProfile _$DataUpdateProfileFromJson(Map<String, dynamic> json) =>
    DataUpdateProfile(
      data: json['data'] == null
          ? null
          : DataUpdateProfileDetail.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUpdateProfileToJson(DataUpdateProfile instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataUpdateProfileDetail _$DataUpdateProfileDetailFromJson(
        Map<String, dynamic> json) =>
    DataUpdateProfileDetail(
      file: json['file'] as String?,
      sId: json['sId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      phone: json['phone'] as String?,
      rememberMe: json['rememberMe'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataUpdateProfileDetailToJson(
        DataUpdateProfileDetail instance) =>
    <String, dynamic>{
      'file': instance.file,
      'sId': instance.sId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'rememberMe': instance.rememberMe,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'id': instance.id,
    };

AllUsersModel _$AllUsersModelFromJson(Map<String, dynamic> json) =>
    AllUsersModel(
      status: json['status'] as String?,
      totalPages: json['totalPages'] as int?,
      results: json['results'] as int?,
      data: json['data'] == null
          ? null
          : DataAllUsers.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllUsersModelToJson(AllUsersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalPages': instance.totalPages,
      'results': instance.results,
      'data': instance.data,
    };

DataAllUsers _$DataAllUsersFromJson(Map<String, dynamic> json) => DataAllUsers(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DataAllUsersInDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataAllUsersToJson(DataAllUsers instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataAllUsersInDetails _$DataAllUsersInDetailsFromJson(
        Map<String, dynamic> json) =>
    DataAllUsersInDetails(
      sId: json['sId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      file: json['file'] as String?,
      role: json['role'] as String?,
      phone: json['phone'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rememberMe: json['rememberMe'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataAllUsersInDetailsToJson(
        DataAllUsersInDetails instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'file': instance.file,
      'role': instance.role,
      'phone': instance.phone,
      'products': instance.products,
      'rememberMe': instance.rememberMe,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };

GetAllProductsModel _$GetAllProductsModelFromJson(Map<String, dynamic> json) =>
    GetAllProductsModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataAll.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductsModelToJson(
        GetAllProductsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataAll _$DataAllFromJson(Map<String, dynamic> json) => DataAll(
      category: json['category'] as String?,
      totalDocs: json['totalDocs'] as int?,
      totalPages: json['totalPages'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => DataProductsDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataAllToJson(DataAll instance) => <String, dynamic>{
      'category': instance.category,
      'totalDocs': instance.totalDocs,
      'totalPages': instance.totalPages,
      'products': instance.products,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      sId: json['sId'] as String?,
      color: json['color'] as String?,
      file: json['file'] as String?,
      sizes: (json['sizes'] as List<dynamic>?)
          ?.map((e) => Sizes.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'sId': instance.sId,
      'color': instance.color,
      'file': instance.file,
      'sizes': instance.sizes,
      'id': instance.id,
    };

Sizes _$SizesFromJson(Map<String, dynamic> json) => Sizes(
      size: json['size'] as String?,
      quantity: json['quantity'] as int?,
      sId: json['sId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SizesToJson(Sizes instance) => <String, dynamic>{
      'size': instance.size,
      'quantity': instance.quantity,
      'sId': instance.sId,
      'id': instance.id,
    };

AddToCartModel _$AddToCartModelFromJson(Map<String, dynamic> json) =>
    AddToCartModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DataAddToCart.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToCartModelToJson(AddToCartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataAddToCart _$DataAddToCartFromJson(Map<String, dynamic> json) =>
    DataAddToCart(
      data: json['data'] == null
          ? null
          : DataAddToCartDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataAddToCartToJson(DataAddToCart instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataAddToCartDetails _$DataAddToCartDetailsFromJson(
        Map<String, dynamic> json) =>
    DataAddToCartDetails(
      product: json['product'] as String?,
      user: json['user'] as String?,
      priceAfterDiscount: json['priceAfterDiscount'] as int?,
      color: json['color'] as String?,
      size: json['size'] as String?,
      imageOfProduct: json['imageOfProduct'] as String?,
      sId: json['sId'] as String?,
      iV: json['iV'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataAddToCartDetailsToJson(
        DataAddToCartDetails instance) =>
    <String, dynamic>{
      'product': instance.product,
      'user': instance.user,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'color': instance.color,
      'size': instance.size,
      'imageOfProduct': instance.imageOfProduct,
      'sId': instance.sId,
      'iV': instance.iV,
      'id': instance.id,
    };

AddToCartModelRequest _$AddToCartModelRequestFromJson(
        Map<String, dynamic> json) =>
    AddToCartModelRequest(
      imageOfProduct: json['imageOfProduct'] as String?,
      detailsId: json['detailsId'] as String?,
      size: json['size'] as String?,
      color: json['color'] as String?,
      priceAfterDiscount: json['priceAfterDiscount'] as String?,
    );

Map<String, dynamic> _$AddToCartModelRequestToJson(
        AddToCartModelRequest instance) =>
    <String, dynamic>{
      'imageOfProduct': instance.imageOfProduct,
      'size': instance.size,
      'color': instance.color,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'detailsId': instance.detailsId,
    };

GetCartModel _$GetCartModelFromJson(Map<String, dynamic> json) => GetCartModel(
      status: json['status'] as String?,
      results: json['results'] as int?,
      data: json['data'] == null
          ? null
          : DataGetCart.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartModelToJson(GetCartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

DataGetCart _$DataGetCartFromJson(Map<String, dynamic> json) => DataGetCart(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              ProductsDetailsForCartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataGetCartToJson(DataGetCart instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductsDetailsForCartModel _$ProductsDetailsForCartModelFromJson(
        Map<String, dynamic> json) =>
    ProductsDetailsForCartModel(
      sId: json['sId'] as String?,
      product: json['product'] == null
          ? null
          : ProductCartModel.fromJson(json['product'] as Map<String, dynamic>),
      user: json['user'] as String?,
      priceAfterDiscount: json['priceAfterDiscount'] as int?,
      color: json['color'] as String?,
      size: json['size'] as String?,
      imageOfProduct: json['imageOfProduct'] as String?,
      iV: json['iV'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductsDetailsForCartModelToJson(
        ProductsDetailsForCartModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'product': instance.product,
      'user': instance.user,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'color': instance.color,
      'size': instance.size,
      'imageOfProduct': instance.imageOfProduct,
      'iV': instance.iV,
      'id': instance.id,
    };

ProductCartModel _$ProductCartModelFromJson(Map<String, dynamic> json) =>
    ProductCartModel(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductCartModelToJson(ProductCartModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'brand': instance.brand,
      'id': instance.id,
    };

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) =>
    PaymentRequestModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentRequestModelToJson(
        PaymentRequestModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductsPayment _$ProductsPaymentFromJson(Map<String, dynamic> json) =>
    ProductsPayment(
      name: json['name'] as String?,
      id: json['id'] as String?,
      price: json['price'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductsPaymentToJson(ProductsPayment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
    };

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      status: json['status'] as String?,
      session: json['session'] == null
          ? null
          : Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'session': instance.session,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amountSubtotal: json['amountSubtotal'] as int?,
      amountTotal: json['amountTotal'] as int?,
      automaticTax: json['automaticTax'] == null
          ? null
          : AutomaticTax.fromJson(json['automaticTax'] as Map<String, dynamic>),
      cancelUrl: json['cancelUrl'] as String?,
      clientReferenceId: json['clientReferenceId'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      customerCreation: json['customerCreation'] as String?,
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customerDetails'] as Map<String, dynamic>),
      customerEmail: json['customerEmail'] as String?,
      expiresAt: json['expiresAt'] as int?,
      invoiceCreation: json['invoiceCreation'] == null
          ? null
          : InvoiceCreation.fromJson(
              json['invoiceCreation'] as Map<String, dynamic>),
      livemode: json['livemode'] as bool?,
      mode: json['mode'] as String?,
      paymentMethodCollection: json['paymentMethodCollection'] as String?,
      paymentMethodTypes: (json['paymentMethodTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentStatus: json['paymentStatus'] as String?,
      status: json['status'] as String?,
      successUrl: json['successUrl'] as String?,
      totalDetails: json['totalDetails'] == null
          ? null
          : TotalDetails.fromJson(json['totalDetails'] as Map<String, dynamic>),
      uiMode: json['uiMode'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'amountSubtotal': instance.amountSubtotal,
      'amountTotal': instance.amountTotal,
      'automaticTax': instance.automaticTax,
      'cancelUrl': instance.cancelUrl,
      'clientReferenceId': instance.clientReferenceId,
      'created': instance.created,
      'currency': instance.currency,
      'customerCreation': instance.customerCreation,
      'customerDetails': instance.customerDetails,
      'customerEmail': instance.customerEmail,
      'expiresAt': instance.expiresAt,
      'invoiceCreation': instance.invoiceCreation,
      'livemode': instance.livemode,
      'mode': instance.mode,
      'paymentMethodCollection': instance.paymentMethodCollection,
      'paymentMethodTypes': instance.paymentMethodTypes,
      'paymentStatus': instance.paymentStatus,
      'status': instance.status,
      'successUrl': instance.successUrl,
      'totalDetails': instance.totalDetails,
      'uiMode': instance.uiMode,
      'url': instance.url,
    };

AutomaticTax _$AutomaticTaxFromJson(Map<String, dynamic> json) => AutomaticTax(
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$AutomaticTaxToJson(AutomaticTax instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      email: json['email'] as String?,
      taxExempt: json['taxExempt'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'taxExempt': instance.taxExempt,
    };

InvoiceCreation _$InvoiceCreationFromJson(Map<String, dynamic> json) =>
    InvoiceCreation(
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$InvoiceCreationToJson(InvoiceCreation instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

TotalDetails _$TotalDetailsFromJson(Map<String, dynamic> json) => TotalDetails(
      amountDiscount: json['amountDiscount'] as int?,
      amountShipping: json['amountShipping'] as int?,
      amountTax: json['amountTax'] as int?,
    );

Map<String, dynamic> _$TotalDetailsToJson(TotalDetails instance) =>
    <String, dynamic>{
      'amountDiscount': instance.amountDiscount,
      'amountShipping': instance.amountShipping,
      'amountTax': instance.amountTax,
    };

AddToFavModel _$AddToFavModelFromJson(Map<String, dynamic> json) =>
    AddToFavModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddToFavModelToJson(AddToFavModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

GetFavModel _$GetFavModelFromJson(Map<String, dynamic> json) => GetFavModel(
      status: json['status'] as String?,
      totalPages: json['totalPages'] as int?,
      results: json['results'] as int?,
      data: json['data'] == null
          ? null
          : DataFav.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFavModelToJson(GetFavModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalPages': instance.totalPages,
      'results': instance.results,
      'data': instance.data,
    };

DataFav _$DataFavFromJson(Map<String, dynamic> json) => DataFav(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProductsDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataFavToJson(DataFav instance) => <String, dynamic>{
      'data': instance.data,
    };
