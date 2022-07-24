import 'app_error.dart';

class NotAddressError extends AppError{

  @override
  final String message;
  NotAddressError(this.message);
}