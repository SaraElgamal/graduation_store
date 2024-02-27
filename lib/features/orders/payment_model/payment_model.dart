import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';


@JsonSerializable()


class PaymentModel {
  DataPayment? data;

  PaymentModel({this.data});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);


}

@JsonSerializable()
class DataPayment {
  String? id;
  String? status;
  int? amount;
  int? fee;
  String? currency;
  int? refunded;
  //Null? refundedAt;
  int? captured;
  // Null? capturedAt;
  // Null? voidedAt;
  String? description;
  String? amountFormat;
  String? feeFormat;
  String? refundedFormat;
  String? capturedFormat;
  //Null? invoiceId;
  String? ip;
  String? callback_url;
  String? createdAt;
  String? updatedAt;
  //Null? metadata;
  Source? source;

  DataPayment({this.id,
    this.status,
    this.amount,
    this.fee,
    this.currency,
    this.refunded,
   // this.refundedAt,
    this.captured,
    // this.capturedAt,
    // this.voidedAt,
    this.description,
    this.amountFormat,
    this.feeFormat,
    this.refundedFormat,
    this.capturedFormat,
   // this.invoiceId,
    this.ip,
    this.callback_url,
    this.createdAt,
    this.updatedAt,
   // this.metadata,
    this.source});

  factory DataPayment.fromJson(Map<String, dynamic> json) => _$DataPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$DataPaymentToJson(this);


}


@JsonSerializable()
class Source {
  String? type;
  String? company;
  String? name;
  String? number;
  String? gatewayId;
  // Null? referenceNumber;
  // Null? token;
  // Null? message;
  String? transaction_url;
  // Null? responseCode;
  // Null? authorizationCode;

  Source({this.type,
    this.company,
    this.name,
    this.number,
    this.gatewayId,
    // this.referenceNumber,
    // this.token,
    // this.message,
    this.transaction_url,
    // this.responseCode,
    // this.authorizationCode

  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

}


@JsonSerializable()

class TextFieldModel
{
  String? amount ;
  String? name ;
  String? number ;
  String? cvc ;
  String? month ;
  String? year ;
  String? description ;
  int? type ;

  TextFieldModel({
      this.amount,
      this.name,
      this.number,
      this.cvc,
      this.month,
      this.year,
      this.description,
      this.type,

  });


  factory TextFieldModel.fromJson(Map<String, dynamic> json) => _$TextFieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$TextFieldModelToJson(this);

}

@JsonSerializable()
class AddFav
{
  String? message;
  String? user_id;

  AddFav({this.message,this.user_id});

  factory AddFav.fromJson(Map<String, dynamic> json) => _$AddFavFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavToJson(this);

}