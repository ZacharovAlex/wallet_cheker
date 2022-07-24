
import 'package:json_annotation/json_annotation.dart';
part 'signals.g.dart';
@JsonSerializable()
class Signal{
  double atm;
  double dark_market;
  double dark_service;
  double exchange_fraudulent;
  double exchange_mlrisk_high;
  double exchange_mlrisk_low;
  double exchange_mlrisk_moderate;
  double exchange_mlrisk_veryhigh;
  double gambling;
  double illegal_service;
  double marketplace;
  double miner;
  double mixer;
  double p2p_exchange_mlrisk_high;
  double p2p_exchange_mlrisk_low;
  double payment;
  double ransom;
  double scam;
  double stolen_coins;
  double wallet;
  Signal({
    required this.atm,
    required this.dark_market,
    required this.dark_service,
    required this.exchange_fraudulent,
    required this.exchange_mlrisk_high,
    required this.exchange_mlrisk_low,
    required this.exchange_mlrisk_moderate,
    required this.exchange_mlrisk_veryhigh,
    required this.gambling,
    required this.illegal_service,
    required this.marketplace,
    required this.miner,
    required this.mixer,
    required this.p2p_exchange_mlrisk_high,
    required this.p2p_exchange_mlrisk_low,
    required this.payment,
    required this.ransom,
    required this.scam,
    required this.stolen_coins,
    required this.wallet,


  });
factory Signal.fromJson(Map<String,dynamic> json) => _$SignalFromJson(json);
}