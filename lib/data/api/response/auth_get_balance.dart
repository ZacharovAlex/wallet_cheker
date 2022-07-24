import 'package:check_wallet/data/api/response/plans.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_get_balance.g.dart';
@JsonSerializable()
class AuthBalance {
  bool result;
  String mobileAcntId;
  int balance;
  int discount;
  double basePrice;
//  List<Plans> plan;

  AuthBalance(
      {
        required this.result,
      required this.mobileAcntId,
      required this.balance,
      required this.discount,
   //   required this.plan,
      required this.basePrice
      });

  factory AuthBalance.fromJson(Map<String, dynamic> parsedJson) => _$AuthBalanceFromJson(parsedJson);


}
