// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      city_id: json['city_id'] as int?,
      region_id: json['region_id'] as int?,
      name_ar: json['name_ar'] as String?,
      name_en: json['name_en'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'city_id': instance.city_id,
      'region_id': instance.region_id,
      'name_ar': instance.name_ar,
      'name_en': instance.name_en,
    };
