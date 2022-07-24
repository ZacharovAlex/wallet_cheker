import 'package:check_wallet/data/api/response/adres_veryfy_response.dart';
import 'package:check_wallet/data/api/response/auth_get_balance.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'wallet_api.g.dart';
@RestApi()
abstract class WalletApi {
  factory WalletApi(Dio dio) = _WalletApi;

  @POST('')
  @FormUrlEncoded()
  Future<Adressverify> verifyAddress(
    @Part() String token,
    @Part() String appId,
    @Part() String mobileId,
    @Part() String asset,
    @Part() String hash,
  );

  @POST('/mobileacnt/')
  @FormUrlEncoded()
  Future<AuthBalance> balanceAuth(
      @Part() String token,
      @Part() String appId,
      @Part() String mobileId,
      @Part() String username,
      );



}
