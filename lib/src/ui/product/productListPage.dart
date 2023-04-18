import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    loadExcelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // TODO:
  void loadExcelData() async {
    ByteData data = await rootBundle.load("assets/Daftar Harga Warung.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      debugPrint(table); //sheet Name
      debugPrint(excel.tables[table]!.maxCols.toString());
      debugPrint(excel.tables[table]!.maxRows.toString());
      for (var row in excel.tables[table]!.rows) {
        // debugPrint("${row[1]!.value}");   // productName
        // debugPrint("${row[2]!.value}");   // stock
        debugPrint("${row[3]?.value ?? 0}");   // priceBuy
        // debugPrint("${row[4]!.value}"); // priceSell
        // debugPrint("${row[5]!.value}");   // type
        // debugPrint("${row[6]?.value ?? ''}");   // category
      }
    }
  }
}
