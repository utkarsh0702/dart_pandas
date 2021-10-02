import 'package:dart_pandas/dart_pandas.dart';

extension DartPandasExtension on List {
  // return the shape of dataframe
  List get shape => DartPandas().shape(this);
  // create a data frame from map
  List dataFrame(Map<String, List> map) => DartPandas().dataFrame(map);
}
