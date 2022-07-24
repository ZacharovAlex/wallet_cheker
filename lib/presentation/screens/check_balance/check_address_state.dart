import '../../../data/api/response/adres_veryfy_response.dart';
import '../../../data/api/response/data.dart';
import '../../../domain/errors/app_error.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_address_state.freezed.dart';


@freezed
class CheckAddressState with _$CheckAddressState {
  const factory CheckAddressState([
    AppError? error,
    Data? data,
    String? hash,
    @Default(false) bool loading,
    String? network,
    @Default(false) bool pasteAddress,
  ]) = _CheckAddressState;
}




