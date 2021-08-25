import 'package:dart_pandas/dart_pandas.dart';

void main() {
  DartPandas dp = DartPandas();
  String address =
      "C:\\Users\\Utkarsh\\Desktop\\Uplift\\Week 6 - Assignment.csv";
  var data = dp.read_csv(address);
  print(data);
}
