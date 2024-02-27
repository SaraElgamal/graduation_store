import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';


@JsonSerializable()

class District {
  int? district_id;
  int? city_id;
  int? region_id;
  String? name_ar;
  String? name_en;




  District(
      {this.district_id, this.city_id, this.region_id, this.name_ar, this.name_en});


  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);


}