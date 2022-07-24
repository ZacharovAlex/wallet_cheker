import 'package:injectable/injectable.dart';

@singleton
class WalletNetworkValidator {

  static bool validateBTCAddress(String value) {
    String pattern = '^(bc1|[13])[a-zA-HJ-NP-Z0-9]{25,39}\$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static bool validateETHAddress(String value) {
    String pattern = '^0x[a-fA-F0-9]{40}\$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }
}
