import 'app_error.dart';

class AddressOrNetworkError extends AppError{

  @override
  final String message;
  AddressOrNetworkError(this.message);
}