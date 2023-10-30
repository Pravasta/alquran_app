import 'dart:convert';

import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:equatable/equatable.dart';

class DetailSurahResponse extends Equatable {
  final int code;
  final String message;
  final DetailSurahModel data;

  const DetailSurahResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory DetailSurahResponse.fromJson(String str) =>
      DetailSurahResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailSurahResponse.fromMap(Map<String, dynamic> json) =>
      DetailSurahResponse(
        code: json["code"],
        message: json["message"],
        data: DetailSurahModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data.toMap(),
      };

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

class DetailSurahModel extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;
  final List<Ayat> ayat;
  final dynamic suratSelanjutnya;
  final dynamic suratSebelumnya;

  const DetailSurahModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    required this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  factory DetailSurahModel.fromJson(String str) =>
      DetailSurahModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailSurahModel.fromMap(Map<String, dynamic> json) {
    dynamic suratSebelumnya = json['suratSebelumnya'];
    dynamic suratSelanjutnya = json['suratSelanjutnya'];
    if (suratSebelumnya == false || suratSelanjutnya == false) {
      suratSebelumnya = false;
      suratSelanjutnya = false;
    } else {
      suratSebelumnya = SuratSenya.fromMap(suratSebelumnya);
      suratSelanjutnya = SuratSenya.fromMap(suratSelanjutnya);
    }

    return DetailSurahModel(
      nomor: json["nomor"],
      nama: json["nama"],
      namaLatin: json["namaLatin"],
      jumlahAyat: json["jumlahAyat"],
      tempatTurun: json["tempatTurun"],
      arti: json["arti"],
      deskripsi: json["deskripsi"],
      audioFull: Map.from(json["audioFull"])
          .map((k, v) => MapEntry<String, String>(k, v)),
      ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromMap(x))),
      suratSelanjutnya: suratSelanjutnya,
      suratSebelumnya: suratSebelumnya,
    );
  }

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
        "ayat": List<dynamic>.from(ayat.map((x) => x.toMap())),
        "suratSelanjutnya": suratSelanjutnya.toMap(),
        "suratSebelumnya": suratSebelumnya.toMap(),
      };

  DetailSurahEntity toEntity() {
    return DetailSurahEntity(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull,
      ayat: ayat.map((e) => e.toEntity()).toList(),
      suratSelanjutnya: suratSelanjutnya,
      suratSebelumnya: suratSebelumnya,
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
        ayat,
        suratSelanjutnya,
        suratSebelumnya,
      ];
}

class Ayat extends Equatable {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, String> audio;

  const Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(String str) => Ayat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toMap() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": Map.from(audio).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  AyatEntity toEntity() {
    return AyatEntity(
      nomorAyat: nomorAyat,
      teksArab: teksArab,
      teksLatin: teksLatin,
      teksIndonesia: teksIndonesia,
      audio: audio,
    );
  }

  @override
  List<Object?> get props => [
        nomorAyat,
        teksArab,
        teksLatin,
        teksIndonesia,
        audio,
      ];
}

class SuratSenya extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;

  const SuratSenya({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  factory SuratSenya.fromJson(String str) =>
      SuratSenya.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuratSenya.fromMap(Map<String, dynamic> json) => SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
      ];
}
