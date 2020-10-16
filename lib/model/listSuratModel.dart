// To parse this JSON data, do
//
//     final listSuratModel = listSuratModelFromJson(jsonString);

import 'dart:convert';

List<ListSuratModel> listSuratModelFromJson(String str) => List<ListSuratModel>.from(json.decode(str).map((x) => ListSuratModel.fromJson(x)));

String listSuratModelToJson(List<ListSuratModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListSuratModel {
    ListSuratModel({
        this.arti,
        this.asma,
        this.audio,
        this.ayat,
        this.keterangan,
        this.nama,
        this.nomor,
        this.rukuk,
        this.type,
        this.urut,
    });

    String arti;
    String asma;
    String audio;
    int ayat;
    String keterangan;
    String nama;
    String nomor;
    String rukuk;
    Type type;
    String urut;

    factory ListSuratModel.fromJson(Map<String, dynamic> json) => ListSuratModel(
        arti: json["arti"],
        asma: json["asma"],
        audio: json["audio"],
        ayat: json["ayat"],
        keterangan: json["keterangan"],
        nama: json["nama"],
        nomor: json["nomor"],
        rukuk: json["rukuk"],
        type: typeValues.map[json["type"]],
        urut: json["urut"],
    );

    Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "audio": audio,
        "ayat": ayat,
        "keterangan": keterangan,
        "nama": nama,
        "nomor": nomor,
        "rukuk": rukuk,
        "type": typeValues.reverse[type],
        "urut": urut,
    };
}

enum Type { MEKAH, MADINAH }

final typeValues = EnumValues({
    "madinah": Type.MADINAH,
    "mekah": Type.MEKAH
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
