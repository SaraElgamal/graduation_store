import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';


@JsonSerializable()
class City {
  int? city_id;
  int? region_id;
  String? name_ar;
  String? name_en;

  City({this.city_id, this.region_id, this.name_ar, this.name_en});
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

}