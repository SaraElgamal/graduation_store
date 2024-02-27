
import 'package:json_annotation/json_annotation.dart';

part 'reg_model.g.dart';


@JsonSerializable()
class Register {
  String? message;
  User? user;

  Register({this.message, this.user});

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);


}


@JsonSerializable()
class User {
  String? name;
  String? email;
  String? otp;
  String? image;
  String? phoneNumber;
  String? password;
  String? updated_at;
  String? created_at;
  int? isValid;
  int? id;

  User({
    this.name,
    this.email,
    this.otp,
    this.phoneNumber,
    this.password,
    this.updated_at,
    this.isValid,
    this.image,
    this.created_at,
    this.id});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);



}