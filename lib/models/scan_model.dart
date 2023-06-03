import 'dart:convert';

ScanModel scanModelFromMap(String str) => ScanModel.fromMap(json.decode(str));

String scanModelToMap(ScanModel data) => json.encode(data.toMap());

class ScanModel {
    int id;
    String type;
    String valor;

    ScanModel({
        required this.id,
        required this.type,
        required this.valor,
    }) {
      if (type.contains('http')){
        type = 'http';
      }else{
        type = 'geo';
      }
    }

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "valor": valor,
    };
}
