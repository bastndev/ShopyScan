import 'package:flutter/material.dart';
import 'package:flutter_qr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans =[];
  String typeSelection = 'http';

  Future<ScanModel> newSCan (String valor ) async{
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);
    // Assign ID to data Base
    newScan.id =id;

    if(typeSelection == newScan.type){
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }
  // --- -- -- -- -- -- Data base Delete etc
  loadingScans() async{
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...?scans];
    notifyListeners();
  }
  loadingType( String type ) async {
    final scans = await DBProvider.db.getScanType(type);
    this.scans = [...?scans];
    typeSelection = type;
    notifyListeners();
  }
  deleteAll() async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
  // -- - --- -- Delete by Type
  deleteScanId( int? id) async{
    await DBProvider.db.deleteScan(id!);
  }
}