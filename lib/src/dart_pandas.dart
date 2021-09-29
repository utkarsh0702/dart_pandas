// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

class DartPandas {
  const DartPandas();

  // read file from disk
  // ignore: non_constant_identifier_names
  Future<List> read_csv(String address, {List? columns}) async {
    List data = [];
    final csvFile = new File(address).openRead();
    print('CSV File read');
    final contents = await csvFile
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    print('Contents extracted');
    bool read = true;
    int count = 0, columnCounter = 0, rowCounter = 1;
    while (true) {
      var rowData = [];
      for (int i = count; i < contents[0].length; i++) {
        try {
          if (contents[0][i].contains('\n')) {
            data.add(rowData);
            if (read) {
              columnCounter = count + 1;
              read = false;
            }
            rowCounter += 1;
            break;
          } else {
            rowData.add(contents[0][i]);
            count += 1;
          }
        } catch (_) {}
      }
      if (count == contents[0].length) {
        break;
      }
    }
    if (columns?.length != 0) {
      if (columns?.length == columnCounter) {
        data.insert(0, columns);
      } else {
        throw new Exception(
            "DartPandasException : Number of Column Names provided are not equal to the number of Columns in the table.");
      }
    }
    // if (columns == null) {
    //   columnsNames = contents[0].split(',');
    // } else {
    //   columnsNames = columns;
    // }
    // print('Column Name if else');
    // contents.forEach((element) => data.add(element.split(',')));
    // print('data added to another list');
    // List columnData = List.generate(contents.length,
    //     (i) => List.filled(columnsNames.length, '', growable: false),
    //     growable: false);
    // print('columnData List created');
    // print(contents);
    // for (int i = 0; i < columnsNames.length; i++) {
    //   for (int j = 0; j < contents.length; j++) {
    //     try {
    //       if (data[j][i] == null) {
    //         columnData[i][j] = "";
    //       } else {
    //         columnData[i][j] = data[j][i];
    //       }
    //     } catch (e) {
    //       print('Error value: ${data[j][i]}, Error: $e');
    //     }
    //   }
    // }
    // print('data inserted in columnData.');
    // print(columnData);
    // var row = contents.length, col = columns_names.length;
    print('Data Returned');
    return data;
  }

  List shape(List data) {
    int column = data[0].length;
    int row = data.length - 1;
    return [row, column];
  }

  List dataFrame(Map<String, List> map) {
    List data = [];
    List columns = map.keys.toList();
    int maxRow = 0;
    map.values.forEach((value) {
      if (value.length > maxRow) {
        maxRow = value.length;
      }
    });
    print(maxRow);
    for (int i = 0; i < maxRow; i++) {
      List dataRow = [];
      map.values.forEach((value) {
        try {
          dataRow.add(value[i]);
        } catch (_) {
          dataRow.add(null);
        }
      });
      print(dataRow);
      data.add(dataRow);
      print(data);
    }
    data.insert(0, columns);
    return data;
  }
}
