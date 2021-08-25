import 'dart:convert';
import 'dart:io';

class DartPandas {
  const DartPandas();

  // read file from disk
  // ignore: non_constant_identifier_names
  Future<List> read_csv(String address, {List? columns}) async {
    List data = [], columnsNames = [];
    final csvFile = new File(address).openRead();
    final contents = await csvFile
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();
    if (columns == null) {
      columnsNames = contents[0].split(',');
    } else {
      columnsNames = columns;
    }
    contents.forEach((element) => data.add(element.split(',')));
    List columnData = List.generate(columnsNames.length,
        (i) => List.filled(contents.length, null, growable: false),
        growable: false);
    for (int i = 0; i < columnsNames.length; i++) {
      for (int j = 0; j < contents.length; j++) {
        columnData[i][j] = data[j][i];
      }
    }
    // var row = contents.length, col = columns_names.length;

    return columnData;
  }
}
