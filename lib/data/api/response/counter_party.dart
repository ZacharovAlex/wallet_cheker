

import 'package:json_annotation/json_annotation.dart';
part 'counter_party.g.dart';
@JsonSerializable()
class CounterParty{
  int id;
  CounterParty({required this.id});
  factory CounterParty.fromJson(Map<String,dynamic> json) => _$CounterPartyFromJson(json);

}