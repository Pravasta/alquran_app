import 'dart:convert';

import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';
import 'package:equatable/equatable.dart';

class SurahModelResponse extends Equatable {
  final int code;
  final String message;
  final List<SurahModel> data;

  const SurahModelResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SurahModelResponse.fromJson(String str) =>
      SurahModelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SurahModelResponse.fromMap(Map<String, dynamic> json) =>
      SurahModelResponse(
        code: json["code"],
        message: json["message"],
        data: List<SurahModel>.from(
            json["data"].map((x) => SurahModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

class SurahModel extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;

  const SurahModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory SurahModel.fromJson(String str) =>
      SurahModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SurahModel.fromMap(Map<String, dynamic> json) => SurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  SurahEntity toEntity() {
    return SurahEntity(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull,
    );
  }

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        deskripsi,
        audioFull,
      ];
}





