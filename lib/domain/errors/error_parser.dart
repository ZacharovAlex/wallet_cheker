import 'package:check_wallet/domain/errors/app_error.dart';
import 'package:check_wallet/domain/errors/default_error.dart';
import 'package:check_wallet/domain/errors/network_connection_error.dart';
import 'package:dio/dio.dart';

AppError parseError(Object error) {
  print(error);
  if (error is DioError &&
      (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout)) {
    return const NetworkConnectionError();
  }
  return const DefaultError();
}


