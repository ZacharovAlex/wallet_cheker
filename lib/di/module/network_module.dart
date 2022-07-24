import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../data/api/wallet_api.dart';
import '../../main.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => 'https://extrnlapiendpoint.silencatech.com';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(
        baseUrl: url, responseType: ResponseType.json, contentType: ContentType.json.toString()));

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: logger.d));

    return dio;
  }

  @lazySingleton
  WalletApi authApi(Dio dio) => WalletApi(dio);


}
