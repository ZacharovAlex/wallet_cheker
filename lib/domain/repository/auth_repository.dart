
import 'package:check_wallet/data/api/wallet_api.dart';
import 'package:check_wallet/domain/hash_provider.dart';
import 'package:injectable/injectable.dart';

import '../../data/api/response/auth_get_balance.dart';
import '../errors/error_parser.dart';
@singleton
class AuthRepository{
  final WalletApi _walletApi;
  final HashProvider _hashProvider;
  AuthRepository(this._walletApi,this._hashProvider);

  Future<AuthBalance> authorize() async {
    try {
      return _walletApi.balanceAuth(_hashProvider.getHashForAuth(),
          _hashProvider.appId, _hashProvider.mobileId, _hashProvider.name);


    } catch (e) {
      throw parseError(e);
    }
  }
}