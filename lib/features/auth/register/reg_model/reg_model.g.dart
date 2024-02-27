// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      otp: json['otp'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      updated_at: json['updated_at'] as String?,
      isValid: json['isValid'] as int?,
      image: json['image'] as String?,
      created_at: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'otp': instance.otp,
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'isValid': instance.isValid,
      'id': instance.id,
    };
