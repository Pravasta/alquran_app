import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:alquran_api/features/home/domain/repos/quran_repository.dart';

class DetailSurahUsecases {
  final QuranRepository quranRepository;

  DetailSurahUsecases(this.quranRepository);

  Future<DetailSurahEntity> getDetailSurah(int surah) async {
    return quranRepository.getDetailSurah(surah);
  }
}
