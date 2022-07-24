

import 'package:json_annotation/json_annotation.dart';

import 'counter_party.dart';
import 'signals.dart';
part 'data.g.dart';
@JsonSerializable()
class Data{
  double riskscore;
  Signal signals;
//  int updated_at;
   String address;
//   String fiat_code_effective;
// //  CounterParty counterpartyes;
 double? reportedAddressBalance;
   bool blackListsConnections;
//   String pdfReport;
   String asset;
//   String timestamp;
  Data({
    required this.riskscore,
    required this.signals,
  //  required this.updated_at,
     required this.address,
  //   required this.fiat_code_effective,
  // //  required this.counterpartyes,
    required this.reportedAddressBalance,
     required this.blackListsConnections,
  //   required this.pdfReport,
    required this.asset,
  //   required this.timestamp
  });
  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
}

// class DataList {
//   final List<Data> datas = [];
//   DataList.fromJson(List<dynamic> jsonItems) {
//     for (var jsonItem in jsonItems) {
//       datas.add(Data.fromJson(jsonItem));
//     }
//   }
// }
// class DataList {
//   final List<Data> datas = [];
//   DataList.fromJson(List<dynamic> jsonItems) {
//     for (var jsonItem in jsonItems) {
//       datas.add(Data.fromJson(jsonItem));
//     }
//   }
// }


// abstract class PostResult {}
//
// // class PostResultSuccess extends PostResult {
// //   final PostList postList;
// //   PostResultSuccess(this.postList);
// // }
//
// //указывает на успешный запрос
// class PostResultSuccess extends PostResult {
//   final Data dataList;
//   PostResultSuccess(this.dataList);
// }
// //PostResultSuccess();
// // произошла ошибка
// class PostResultFailure extends PostResult {
//   final String error;
//   PostResultFailure(this.error);
// }
//
// // загрузка данных
// class PostResultLoading extends PostResult {
//   PostResultLoading();
// }
abstract class PostResult {}

// class PostResultSuccess extends PostResult {
//   final PostList postList;
//   PostResultSuccess(this.postList);
// }

//указывает на успешный запрос
class PostResultSuccess extends PostResult {
  final Data dataList;
  PostResultSuccess(this.dataList);
}
//PostResultSuccess();
// произошла ошибка
class PostResultFailure extends PostResult {
  final String error;
  PostResultFailure(this.error);
}

// загрузка данных
class PostResultLoading extends PostResult {
  PostResultLoading();
}