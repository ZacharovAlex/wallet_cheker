import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'adres_veryfy_response.g.dart';

@JsonSerializable()
class Adressverify {
  bool result;
  int? balance;
  int discount;
  Data? data;
  String? description;

  Adressverify(
      {required this.description,required this.result, required this.balance, required this.data, required this.discount});

  factory Adressverify.fromJson(Map<String, dynamic> json) => _$AdressverifyFromJson(json);
}
