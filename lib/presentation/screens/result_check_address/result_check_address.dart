import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Themes.dart';
import '../../../data/api/response/data.dart';
import '../../../di/injectable.dart';
import '../check_balance/check_address_cubit.dart';

//1BoatSLRHtKNngkdXEeobR76b53LETtpyT BTC
//1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX
//0xf791134fd5df3672bf42712de661aef43ead19bd
class ResultCheck extends StatelessWidget {
  final Data data;

  const ResultCheck({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // print('DATA hjhhjhj $data');
    return MaterialApp(
theme: defaultTheme,

      home: Scaffold(

       appBar: AppBar(centerTitle: true, toolbarHeight: 54,title: Text('Result'),backgroundColor: Colors.black,),
       // backgroundColor: Colors.black,
        body: BlocProvider(


            create: (_) => getIt.get<CheckAddressCubit>(),

          child: ResultScreen(data: data,),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final Data data;
  const ResultScreen({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final data = context.select((CheckAddressCubit cubit) => cubit.state.data);
    print('DATA   $data');
    String addressoutput = data.address.substring(0,5)+'...'+data.address.substring(data.address.length-9,data.address.length);
    double risk = data.riskscore*100;
    String textrisk = risk<20? 'Low' : 'Hight';
    String cryptoname = data.asset=='BTC'? 'Bitcoin' : 'Ethereum';
    String badsignalsfull = ((data.signals.dark_market+data.signals.mixer+data.signals.exchange_fraudulent+data.signals.dark_service+data.signals.scam)*100).toString();
    String suspiciousfull = ((data.signals.exchange_mlrisk_high+data.signals.exchange_mlrisk_moderate+data.signals.exchange_mlrisk_veryhigh+data.signals.gambling+data.signals.atm)*100).toString();
    String trustedfull = ((data.signals.exchange_mlrisk_low+data.signals.wallet+data.signals.payment+data.signals.miner)*100).toString();
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white, fontSize: 14,fontFamily: 'Gilroy',fontWeight: FontWeight.w400),
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 20),
       // width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(

             // crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 17,bottom: 15),
                     child: Text(cryptoname),
                   ),
                  Text(addressoutput),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 19),
                    child: data.reportedAddressBalance==null? SizedBox() : Text('${data.reportedAddressBalance}'),
                  ),

                  Container(color: Colors.blue,width: 140.38,height: 81.56,),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 30),
                    child: Text('$textrisk risk of blocking',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,height: 1.3),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 3),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.accessible_forward),Text('$risk%',style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700),)],),
                  ),
                  Text('Risk Score',style: TextStyle(fontSize: 16,color: Colors.white,height: 1.42,fontWeight: FontWeight.w700),),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.59,bottom: 10.59),
                    child: Icon(Icons.add),
                  ),
                  Text('Sanctions free'),
                  Padding(
                    padding: const EdgeInsets.only(top: 7,bottom: 16),
                    child: Text('This wallet is not sanctions'),
                  ),
                  Text('Learn About Sanctions'),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.59,bottom: 10.59),
                    child: Container(
                      margin: EdgeInsets.only(top: 24,bottom: 23,right: 20,left: 20),
                      child: Column(children: [
                     Text('Hight risk of Blocking'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 20),
                        child: Text('This wallet has a big chance of being blocked on centralize cryptoexchanges (like Binance, Huobi, etc). To prevent this from we recommend to speak with AML officer.'),
                      ),
                        Text('More about risk score'),

                    ],),),
                  ),
                  Text('Connections of the wallet'),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20),
                    child: Column(children: [
                    Row(children: [Icon(Icons.ac_unit_rounded),SizedBox(width: 8),Text('Danger'),Expanded(child: Divider(indent: 10,endIndent: 10,thickness: 2,color: Color(0xFFBEC6CB).withOpacity(0.05),)),Text(badsignalsfull)],),
                      SizedBox(height: 20,),
                      Row(children: [Icon(Icons.ac_unit_rounded),SizedBox(width: 8),Text('Suspicious sources'),Expanded(child: Divider(indent: 10,endIndent: 10,thickness: 2,color: Color(0xFFBEC6CB).withOpacity(0.05),)),Text(suspiciousfull)],),
                      SizedBox(height: 20,),
                      Row(children: [Icon(Icons.ac_unit_rounded),SizedBox(width: 8),Text('Trusted sources'),Expanded(child: Divider(indent: 10,endIndent: 10,thickness: 2,color: Color(0xFFBEC6CB).withOpacity(0.05),)),Text(trustedfull)],),
                  ],),)

              ],),
            ],
          ),
        ),
      ),
    );
  }
}
