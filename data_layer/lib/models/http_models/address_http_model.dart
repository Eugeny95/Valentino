

import 'package:json_annotation/json_annotation.dart';

part 'address_http_model.g.dart';




@JsonSerializable()
class AddressHttpModel{
  
  String? street;
  String? house;
  int? flat;
  int? entrance;
  int? floor;
  String? doorphone;


  AddressHttpModel({required this.doorphone, required this.entrance, required this.flat,
  required this.floor, required this.house, required this.street});

  



  factory AddressHttpModel.fromJson(Map<String, dynamic> json) =>
      _$AddressHttpModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$AddressHttpModelToJson(this);
}
