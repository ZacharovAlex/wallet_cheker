import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:crypto/crypto.dart';
@lazySingleton
class HashProvider{
  final mobileId = '12345678901234561';
  final acsesKey = 'gnt6K2Y4kP84CUscniY5Sm9C32d8Jc8J';
  final appId = '5';
  final name = 'AlexDD';

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

 String getHashForAddress(String walletAddress) {
    return _generateMd5('$walletAddress:$acsesKey:$mobileId:$mobileId');
 }
  String getHashForAuth() {
    return _generateMd5('$appId:$acsesKey:$mobileId:$mobileId');
  }

}