import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'plans.g.dart';
@JsonSerializable()
class Plans {
  int id;
  String name;
  int price;
  int value;
Plans({required this.id,required this.value,required this.name, required this.price});

  factory Plans.fromJson(Map<String, dynamic> parsedJson) => _$PlansFromJson(parsedJson);
  }


