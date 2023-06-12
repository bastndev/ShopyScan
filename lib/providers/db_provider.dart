import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_qr/models/scan_model.dart';
export 'package:flutter_qr/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

// DataBase
  Future<Database> initDB() async {
    // Path of Stored Data Base
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    // ignore: avoid_print
    print(path);

    // Create DAta Base
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            valor TEXT
          )
      ''');
    });
  }

  // --- --- ---  Imagine
  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final valor = newScan.valor;

    // Verify Data bas
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans (id, type, valor)
        VALUES($id, '$type', '$valor')
    ''');

    return res;
  }

  // --- -- --- Create new Scan Model
  newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

// -- -- -- -- get by ID
  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

// -- -- -- -- get All Scans
  Future<List<ScanModel>?> getAllScan() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

// -- -- -- -- get by type
Future<List<ScanModel>?> getScanType(String type) async {
  final db = await database;
  final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE type = '$type'
  ''');

  return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
}


  // --- --- --- --- Update Scan Model
  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  //--- --- --- --- --- Delete Data Base
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }
  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }
}