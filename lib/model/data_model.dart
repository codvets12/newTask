import 'package:flutter/cupertino.dart';

class Data {
  Data({required this.AccountName, required this.value});
  String AccountName;
  String value;
  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(AccountName: json['AccountName'], value: json['value']);
  Map<String, dynamic> toJson() => {"AccountName": AccountName, "value": value};
}
