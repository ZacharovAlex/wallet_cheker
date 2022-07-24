import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:check_wallet/domain/errors/api_error.dart';

import 'package:injectable/injectable.dart';
import '../../../data/api/wallet_api.dart';
import '../../../domain/errors/app_error.dart';
import '../../../domain/errors/no_address_or_network_error.dart';
import '../../../domain/errors/not_address_error.dart';
import '../../../domain/hash_provider.dart';
import '../../../domain/repository/check_address_repository.dart';
import '../../../domain/wallet_network_validator.dart';
import 'check_address_state.dart';
import 'package:crypto/crypto.dart';

@injectable
class CheckAddressCubit extends Cubit<CheckAddressState> {
  final CheckAddressRepository _checkAddressRepository;
  final WalletNetworkValidator _walletNetworkValidator;

  CheckAddressCubit(this._checkAddressRepository, this._walletNetworkValidator)
      : super(const CheckAddressState());

  Future<void> getAddressVerify(String walletAddress, String asset) async {
    try {
      final response = await _checkAddressRepository.getAddressVerify(walletAddress, asset);
      if (response.result && response.data != null) {
        emit(state.copyWith(data: response.data, error: null, loading: false));
      } else {
        emit(state.copyWith(error: ApiError(response.description ?? 'Error'), loading: false));
      }
    } on AppError catch (e) {
      emit(state.copyWith(error: e, loading: false));
      // print()
      print('$e');
    }
  }

  void pasteAddress() {
    FlutterClipboard.paste().then((value) {
      String? network;
     // ApiError error;
      if (WalletNetworkValidator.validateBTCAddress(value)) {
        network = 'BTC';
        emit(state.copyWith(hash: value, error: null, network: network));
      } else if (WalletNetworkValidator.validateETHAddress(value)) {
        network = 'ETH';
        emit(state.copyWith(hash: value, error: null, network: network));
      } else {
        emit(state.copyWith(
            hash: value,
            network: null,
            error: NotAddressError(
                'Это не похоже на  адрес кошелька. Проверьте, может где-то ошибка или вы не то скопировали')));
      }

      print('NETWORK $network');
    });
  }

  // void checkEmptyInputTrue(){
  //   emit(state.copyWith(paste_adress: true));
  // }
  void clearInputAddress() {
    emit(state.copyWith(hash: null, error: null));
  }

  void checkAddress() {
   // AddressOrNetworkError error;
    if (state.hash != null && state.network != null) {
      emit(state.copyWith(loading: true));
      getAddressVerify(state.hash!, state.network!);
    }else {
     // error.message = 'Введите адрес кошелька и его сеть';
      emit(state.copyWith(error: AddressOrNetworkError('Введите адрес кошелька и его сеть')));}
  }
}
