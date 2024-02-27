import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';


@JsonSerializable()

class Region {
  int? region_id;
  int? capital_city_id;
  String? code;
  String? name_ar;
  String? name_en;
  int? population;

  Region({this.region_id,
    this.capital_city_id,
    this.code,
    this.name_ar,
    this.name_en,
    this.population});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);

}