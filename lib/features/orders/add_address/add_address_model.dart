

import 'package:json_annotation/json_annotation.dart';

part 'add_address_model.g.dart';


@JsonSerializable()

class AddAddress {
  String? message;
  DataAddress? data;

  AddAddress({this.message, this.data});

  factory AddAddress.fromJson(Map<String, dynamic> json) => _$AddAddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressToJson(this);


}
@JsonSerializable()
class GetAllAddress {
  List<DataAddress>? data;

  GetAllAddress({ this.data});

  factory GetAllAddress.fromJson(Map<String, dynamic> json) => _$GetAllAddressFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllAddressToJson(this);


}

@JsonSerializable()
class DataAddress {
  int? user_id;
  String? city;
  String? region;
  String? district;
  String? full_name;
  String? address_line1;
  String? address_line2;
  String? notes;
  String? postal_code;
  String? phone_number;
  String? phone_number2;
  String? updated_at;
  String? created_at;
  int? id;


  DataAddress({
    this.user_id,
    this.city,
    this.region,
    this.district,
    this.full_name,
    this.address_line1,
    this.postal_code,
    this.phone_number2,
    this.notes,
    this.address_line2,
    this.phone_number,
    this.updated_at,
    this.created_at,
    this.id});

  factory DataAddress.fromJson(Map<String, dynamic> json) => _$DataAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DataAddressToJson(this);


}