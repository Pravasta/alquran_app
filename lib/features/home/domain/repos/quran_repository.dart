import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';

abstract class QuranRepository {
  Future<List<SurahEntity>> getSurah();
  Future<DetailSurahEntity> getDetailSurah(int surah);
}
