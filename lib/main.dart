import 'dart:convert';

import 'package:check_wallet/main_qbit.dart';
import 'package:check_wallet/presentation/screens/check_balance/check_address_screen.dart';
import 'package:check_wallet/presentation/screens/result_check_address/result_check_address.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'Themes.dart';
import 'data/api/response/adres_veryfy_response.dart';
import 'package:crypto/crypto.dart';

import 'di/injectable.dart';

final logger = Logger(printer: SimplePrinter());
void main() {
  configureDependencies();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => MainCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: defaultTheme,
        home: const CheckBalanceScreen(),
      ),
    );
  }
}




// class GetValueFromClass{
//
//
//   Future<Adressverify> GetAdresValue() async{
//     String? balance = '';
//     String? risk = '';
//
//     print('delau class');
//     Adressverify gg = await  FromAPI().getAdresVerify();           //getAdresVerify();
//     print('$gg');
//     balance=gg.balance.toString();
//     print(balance);
//     return gg;
//     risk=gg.data.riskscore.toString();
//     print(risk);
//
//   }
//
//
//
// }

