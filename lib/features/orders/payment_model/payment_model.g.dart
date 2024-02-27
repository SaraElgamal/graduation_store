// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      data: json['data'] == null
          ? null
          : DataPayment.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataPayment _$DataPaymentFromJson(Map<String, dynamic> json) => DataPayment(
      id: json['id'] as String?,
      status: json['status'] as String?,
      amount: json['amount'] as int?,
      fee: json['fee'] as int?,
      currency: json['currency'] as String?,
      refunded: json['refunded'] as int?,
      captured: json['captured'] as int?,
      description: json['description'] as String?,
      amountFormat: json['amountFormat'] as String?,
      feeFormat: json['feeFormat'] as String?,
      refundedFormat: json['refundedFormat'] as String?,
      capturedFormat: json['capturedFormat'] as String?,
      ip: json['ip'] as String?,
      callback_url: json['callback_url'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataPaymentToJson(DataPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'amount': instance.amount,
      'fee': instance.fee,
      'currency': instance.currency,
      'refunded': instance.refunded,
      'captured': instance.captured,
      'description': instance.description,
      'amountFormat': instance.amountFormat,
      'feeFormat': instance.feeFormat,
      'refundedFormat': instance.refundedFormat,
      'capturedFormat': instance.capturedFormat,
      'ip': instance.ip,
      'callback_url': instance.callback_url,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'source': instance.source,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      type: json['type'] as String?,
      company: json['company'] as String?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      gatewayId: json['gatewayId'] as String?,
      transaction_url: json['transaction_url'] as String?,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'type': instance.type,
      'company': instance.company,
      'name': instance.name,
      'number': instance.number,
      'gatewayId': instance.gatewayId,
      'transaction_url': instance.transaction_url,
    };

TextFieldModel _$TextFieldModelFromJson(Map<String, dynamic> json) =>
    TextFieldModel(
      amount: json['amount'] as String?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      cvc: json['cvc'] as String?,
      month: json['month'] as String?,
      year: json['year'] as String?,
      description: json['description'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$TextFieldModelToJson(TextFieldModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
      'number': instance.number,
      'cvc': instance.cvc,
      'month': instance.month,
      'year': instance.year,
      'description': instance.description,
      'type': instance.type,
    };

AddFav _$AddFavFromJson(Map<String, dynamic> json) => AddFav(
      message: json['message'] as String?,
      user_id: json['user_id'] as String?,
    );

Map<String, dynamic> _$AddFavToJson(AddFav instance) => <String, dynamic>{
      'message': instance.message,
      'user_id': instance.user_id,
    };
