import 'dart:io';

import 'package:alquran_api/common/exception/failure.dart';
import 'package:alquran_api/common/exception/server_exception.dart';
import 'package:alquran_api/features/home/data/datasources/quran_remote_datasources.dart';
import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';
import 'package:alquran_api/features/home/domain/repos/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDatasource remoteDatasource;

  QuranRepositoryImpl({required this.remoteDatasource});

  @override
  Future<DetailSurahEntity> getDetailSurah(int surah) async {
    try {
      final result = await remoteDatasource.getDetailSurahModel(surah);
      return result.toEntity();
    } on ServerException {
      rethrow;
    } on SocketException {
      throw const ServerFailure('Can connect to network');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<SurahEntity>> getSurah() async {
    try {
      final result = await remoteDatasource.getSurahModel();
      return result.map((e) => e.toEntity()).toList();
    } on ServerException {
      rethrow;
    } on SocketException {
      throw const ServerFailure('Can connect to network');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
