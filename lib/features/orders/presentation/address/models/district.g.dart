// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      district_id: json['district_id'] as int?,
      city_id: json['city_id'] as int?,
      region_id: json['region_id'] as int?,
      name_ar: json['name_ar'] as String?,
      name_en: json['name_en'] as String?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'district_id': instance.district_id,
      'city_id': instance.city_id,
      'region_id': instance.region_id,
      'name_ar': instance.name_ar,
      'name_en': instance.name_en,
    };
