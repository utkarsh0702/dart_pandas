import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

class DartPandas {
  const DartPandas();

  // read file from disk
  // ignore: non_constant_identifier_names
  Future<List> read_csv(String address, {List? columns}) async {
    List data = [], columnsNames = [];
    final csvFile = new File(address).openRead();
    print('CSV File read');
    final contents = await csvFile
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    print('Contents extracted');
    print(contents);
    int row = 0, count = 0;
    while (true) {
      var rowData = [];
      for (int i = count; i < contents[0].length; i++) {
        try {
          if (contents[0][i].contains('\n')) {
            data.add(rowData);
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
    print("Data: $data");
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

    return contents;
  }
}
