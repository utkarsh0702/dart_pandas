import 'package:dart_pandas/dart_pandas.dart';

void main() {
  DartPandas dp = DartPandas();
  // String address = "C:\\Users\\Utkarsh\\Desktop\\iris.csv";
  // var data = dp.read_csv(address);
  // print(data);
  var data = dp.dataFrame({
    "Temprature": [10.0, 20.0, 30.0, 40.0, 50.0, 60.0],
    "Humidity": [50.0, 40.0, 30.0, 20.0, 10.0, 60.0],
    "Wind Speed": [100, 90, 80, 70, 60]
  });
  print(data);
  List shape = data.shape;
  print(shape);
}
