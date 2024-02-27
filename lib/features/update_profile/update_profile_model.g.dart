// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      user: json['user'] == null
          ? null
          : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      imageProfile: json['imageProfile'] as String?,
      gender: json['gender'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'imageProfile': instance.imageProfile,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'created_at': instance.created_at,
    };
