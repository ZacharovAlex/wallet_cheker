import 'package:check_wallet/data/api/wallet_api.dart';
import 'package:check_wallet/domain/hash_provider.dart';
import 'package:injectable/injectable.dart';

import '../../data/api/response/adres_veryfy_response.dart';
import '../../data/api/response/auth_get_balance.dart';
import '../errors/error_parser.dart';

@singleton
class CheckAddressRepository {
  final WalletApi _walletApi;
  final HashProvider _hashProvider;

  CheckAddressRepository(this._hashProvider, this._walletApi);

  Future<Adressverify> getAddressVerify(String walletAddress, String asset) async {
    try {
      return _walletApi.verifyAddress(_hashProvider.getHashForAddress(walletAddress),
          _hashProvider.appId, _hashProvider.mobileId, asset, walletAddress);
    } catch (e) {
      throw parseError(e);
    }
  }
}
