import 'package:check_wallet/domain/errors/app_error.dart';

class ApiError extends AppError{
  @override
  final String message;
  ApiError(this.message);
}