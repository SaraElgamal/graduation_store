// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      region_id: json['region_id'] as int?,
      capital_city_id: json['capital_city_id'] as int?,
      code: json['code'] as String?,
      name_ar: json['name_ar'] as String?,
      name_en: json['name_en'] as String?,
      population: json['population'] as int?,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'region_id': instance.region_id,
      'capital_city_id': instance.capital_city_id,
      'code': instance.code,
      'name_ar': instance.name_ar,
      'name_en': instance.name_en,
      'population': instance.population,
    };
