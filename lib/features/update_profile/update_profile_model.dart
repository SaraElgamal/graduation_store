import 'package:json_annotation/json_annotation.dart';

part 'update_profile_model.g.dart';


@JsonSerializable()

class ProfileUser {
  List<DataProfile>? data;

  ProfileUser({this.data});



  factory ProfileUser.fromJson(Map<String, dynamic> json) => _$ProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);

}

@JsonSerializable()
class DataProfile {
  UserProfile? user;

  DataProfile({this.user});


  factory DataProfile.fromJson(Map<String, dynamic> json) => _$DataProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataProfileToJson(this);

}


@JsonSerializable()
class UserProfile {
  int? id;
  String? name;
  String? email;
  String? imageProfile;
  int? gender;
  String? phoneNumber;
  //Null? idNumber;
  String? created_at;
  UserProfile(
      {this.id,
        this.name,
        this.email,
        this.imageProfile,
        this.gender,
        this.phoneNumber,
       // this.idNumber,
        this.created_at});



  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

}