import 'package:bloc/bloc.dart';
import 'package:check_wallet/domain/errors/app_error.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api/wallet_api.dart';
import '../../../domain/hash_provider.dart';
import '../../../domain/repository/auth_repository.dart';
import 'auth_balance_state.dart';

@injectable
class AuthBalanceCubit extends Cubit<AuthBalanceState> {
  final AuthRepository _authRepository;

  AuthBalanceCubit(this._authRepository) : super(InitialStateAuth());

  Future<void> authBalance() async {
    try {
      final response = await _authRepository.authorize();

      emit(LoadedStateAuth(response));
    } on AppError catch (e) {
      emit(InvalidKeyState(e));
    } catch (e) {
      print(e);
    }
  }
}
