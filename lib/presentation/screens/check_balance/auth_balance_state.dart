

import 'package:check_wallet/domain/errors/app_error.dart';

import '../../../data/api/response/auth_get_balance.dart';

abstract class AuthBalanceState{}

class InitialStateAuth extends AuthBalanceState{


}

class InvalidKeyState extends AuthBalanceState{
  final AppError error;
  InvalidKeyState(this.error);
}

class LoadedStateAuth extends AuthBalanceState{
  final AuthBalance authBalance;
  LoadedStateAuth(this.authBalance);
}