// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddress _$AddAddressFromJson(Map<String, dynamic> json) => AddAddress(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataAddress.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAddressToJson(AddAddress instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

GetAllAddress _$GetAllAddressFromJson(Map<String, dynamic> json) =>
    GetAllAddress(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllAddressToJson(GetAllAddress instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataAddress _$DataAddressFromJson(Map<String, dynamic> json) => DataAddress(
      user_id: json['user_id'] as int?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      district: json['district'] as String?,
      full_name: json['full_name'] as String?,
      address_line1: json['address_line1'] as String?,
      postal_code: json['postal_code'] as String?,
      phone_number2: json['phone_number2'] as String?,
      notes: json['notes'] as String?,
      address_line2: json['address_line2'] as String?,
      phone_number: json['phone_number'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DataAddressToJson(DataAddress instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'city': instance.city,
      'region': instance.region,
      'district': instance.district,
      'full_name': instance.full_name,
      'address_line1': instance.address_line1,
      'address_line2': instance.address_line2,
      'notes': instance.notes,
      'postal_code': instance.postal_code,
      'phone_number': instance.phone_number,
      'phone_number2': instance.phone_number2,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
    };
