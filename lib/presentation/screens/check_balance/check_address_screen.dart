import 'package:check_wallet/di/injectable.dart';
import 'package:check_wallet/presentation/screens/check_balance/check_address_cubit.dart';
import 'package:check_wallet/presentation/screens/check_balance/check_address_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Themes.dart';
import '../result_check_address/result_check_address.dart';
import 'auth_balance_cubit.dart';
import 'auth_balance_state.dart';

class CheckBalanceScreen extends StatelessWidget {
  const CheckBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
theme: defaultTheme,
      home: Scaffold(

        appBar: AppBar( toolbarHeight: 54,title: Text('Wallet Checker',style: TextStyle(color: Colors.white.withOpacity(0.2),fontSize: 18,fontWeight: FontWeight.w600),),backgroundColor: Colors.transparent,),
        // backgroundColor: Colors.black,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt.get<AuthBalanceCubit>(),
            ),
            BlocProvider(
              create: (_) => getIt.get<CheckAddressCubit>(),
            ),
          ],
          child: const AuthBalanceView(),
        ),
      ),
    );
  }
}

class AuthBalanceView extends StatefulWidget {
  const AuthBalanceView({Key? key}) : super(key: key);

  @override
  State<AuthBalanceView> createState() => _AuthBalanceViewState();
}

class _AuthBalanceViewState extends State<AuthBalanceView> {


  @override
  Widget build(BuildContext context) {

    return BlocListener<CheckAddressCubit, CheckAddressState>(
      listenWhen: (prev, current) => prev.data != current.data,
      listener: (_, state) {
        var data = state.data;
        if (data != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => ResultCheck(
                        data: data,
                      )));
        }
      },
      child: Stack(
        children: [
          Column(
            children: [
              //TopRowBalance(),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 18, left: 18),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(12))),
                  // color: Colors.black,
                  child: Column(
                    children: [
                      const Expanded(child: HashAddressTextfield()),
                      Divider(
                        color: Colors.white.withOpacity(0.2),
                        //0x71C7656EC7ab88b098defB751B7401B5f6d8976F
                        thickness: 2,
                        indent: 19,
                        endIndent: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 15),
                        child: Row(

                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  context.read<CheckAddressCubit>().pasteAddress();
                                },
                                child: Text('Paste')),
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [SvgPicture.asset('lib/assets/icons/warning.svg'), Text('Scan')],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.only(top: 8,bottom: 18),
                child: Container(
                  child: SizedBox(
                           height: 40,
                      child: ErrorWidgetText()),
                ),
              ),
              const Expanded(
                child: RadialGradientContainer(),
              )
            ],
          ),
         // Center(child: Loader()),
        ],
      ),
    );
  }
}

class TopRowBalance extends StatelessWidget {
  const TopRowBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18,right: 18,top: 30),
        child: Container(

         // color: Colors.green.withOpacity(0.2),
           // height: 105,
            child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

              Text('Wallet Checker',
                  style: TextStyle(color: Colors.white.withOpacity(0.2),fontSize: 18,fontWeight: FontWeight.w600
                  )),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    // padding: const EdgeInsets.symmetric(horizontal: 24),
                    // color: Colors.redAccent,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(24),
                    // ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chevron_right, color: Colors.white),
                        SizedBox(width: 6),
                        Text("Checks", style: TextStyle(color: Colors.white)),

                      ],
                    ),
                  ),
            ])));
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.select((CheckAddressCubit cubit) => cubit.state.loading);
    return loading ? const CircularProgressIndicator() : const SizedBox();
  }
}

class HashAddressTextfield extends StatefulWidget {
  const HashAddressTextfield({
    Key? key,
  }) : super(key: key);

  @override
  State<HashAddressTextfield> createState() => _HashAddressTextfieldState();
}

class _HashAddressTextfieldState extends State<HashAddressTextfield> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final network = context.select((CheckAddressCubit cubit) => cubit.state.network);
    // final pasteAdress = context.select((CheckAddressCubit cubit) => cubit.state.pasteAddress);
    return BlocListener<CheckAddressCubit, CheckAddressState>(
      listenWhen: (prev, current) => current.hash != null && prev.hash != current.hash,
      listener: (_, state) {
        _controller.text = state.hash!;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ClearButton(),
          Center(
            child: TextField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.top,
              controller: _controller,
              enabled: false,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              style: TextStyle(
                  fontSize: 24,
                  height: 1.4,
                  color: network == null ? const Color(0xFFff6d5c) : Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500),
              //network == null ? Theme.of(context).textTheme.headline1 : Theme.of(context).textTheme.headline2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFFacadb9).withOpacity(0.6)),
                hintText: 'Paste or scan address',
                labelStyle: TextStyle(fontSize: 24),
              ),
            ),
          ),
          const NetworkSelect(),
        ],
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hash = context.select((CheckAddressCubit cubit) => cubit.state.hash);
    if (hash != null) {
      return TextButton(
          onPressed: () {
            //  _controller.text = ''; //TODO Очистить текстфилд
            context.read<CheckAddressCubit>().clearInputAddress();
            //0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B
            //bc1qxy2kgdygjrsqtzq2nf2493p83kkfjhx0
          },
          child: const Text('Clear'));
    } else {
      return const SizedBox();
    }
  }
}

class NetworkSelect extends StatelessWidget {
  const NetworkSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hash = context.select((CheckAddressCubit cubit) => cubit.state.hash);
    final network = context.select((CheckAddressCubit cubit) => cubit.state.network);
    if (hash != null) {
      return TextButton(onPressed: () {}, child: network!=null? Text('$network'):Text('Unknow'));
    } else {
      return const SizedBox();
    }
  }
}

class RadialGradientContainer extends StatelessWidget {
  const RadialGradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Center(

      child: Stack(
        children: [

          Ink(

            width: 176,
           height: 176,
           decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black,

                 boxShadow: [
                   BoxShadow(
                     color: Color(0xFFc430dc).withOpacity(0.2),
                     // spreadRadius: 100,
                     blurRadius: 100,
                     offset: Offset(0, 4),
                   ) ,
                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.1),
                     // spreadRadius: 11.29,
                     blurRadius: 11.29,
                     offset: Offset(0, -0.06),
                   ),
                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.2),
                     //  spreadRadius: 21.2,
                     blurRadius: 21.2,
                     offset: Offset(0, -0.13),
                   ),
                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.2),
                     // spreadRadius: 29.91,
                     blurRadius: 29.91,
                     offset: Offset(0, -0.25),
                   ),

                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.3),
                     // spreadRadius: 50.34,
                     blurRadius: 50.34,
                     offset: Offset(0, -0.84),
                   ),
                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.5),
                     // spreadRadius: 96,
                     blurRadius: 96,
                     offset: Offset(0, -2),
                   ),

                   BoxShadow(
                     color: Color(0xFF27b3f4).withOpacity(0.2),
                     // spreadRadius: 38.3,
                     blurRadius: 38.3,
                     offset: Offset(0, -0.45),
                   ),
    ]),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: (){
               // onTap: () => //print('click'),
                context.read<CheckAddressCubit>().checkAddress();
              },
              child: Container(

                child: Center(
                    child: Text(
                  'Check',
                  style: Theme.of(context).textTheme.headline3,
                )),
              ),
            ),
          ),
        ],
      ),
    );

    //  );
  }
}

class ErrorWidgetText extends StatefulWidget {
  const ErrorWidgetText({Key? key}) : super(key: key);

  @override
  State<ErrorWidgetText> createState() => _ErrorWidgetTextState();
}

class _ErrorWidgetTextState extends State<ErrorWidgetText> {
  @override
  Widget build(BuildContext context) {
    final error = context.select((CheckAddressCubit cubit) => cubit.state.error?.message);
    if (error != null) {
      // print(error);
      return Padding(
        padding: EdgeInsets.only(top: 8,left: 34,right: 32),
        child: Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFff6d5c), fontSize: 12,fontWeight: FontWeight.w400,height: 1.4),
        ),
      );
    } else {
      //  print('netu');
      return const SizedBox();
    }
  }
}
