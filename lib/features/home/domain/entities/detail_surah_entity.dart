import 'package:equatable/equatable.dart';

class DataDetailSurah extends Equatable {
  final int code;
  final String message;
  final DetailSurahEntity data;

  const DataDetailSurah({
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        code,
        message,
        data,
      ];
}

class DetailSurahEntity extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;
  final List<AyatEntity> ayat;
  final dynamic suratSelanjutnya;
  final dynamic suratSebelumnya;

  const DetailSurahEntity({
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

class AyatEntity extends Equatable {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, String> audio;

  const AyatEntity({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  @override
  List<Object?> get props => [
        nomorAyat,
        teksArab,
        teksLatin,
        teksIndonesia,
        audio,
      ];
}

class SuratSenyaEntity extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;

  const SuratSenyaEntity({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
      ];
}
