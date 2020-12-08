import 'package:sqflite/sqlite_api.dart';
class TransactionDetails{
  int transId;
	String transDesc;
  String transTimeStamp;
  String transAmount;
  String transCategory;

  TransactionDetails({this.transId, this.transDesc, this.transAmount, this.transCategory, this.transTimeStamp});

  factory TransactionDetails.fromMap(Map<String, dynamic> json) => new TransactionDetails(
    transId:  json['id'],
    transDesc: json['description'],
    transAmount: json['amount'],
    transCategory: json['category'],
    transTimeStamp: json['timestamp']


  );

  Map<String, dynamic> toMap() => {
      'id': transId,
      'description':transDesc,
      'timestamp': transTimeStamp,
      'amount': transAmount,
      'category': transCategory,
  };
}