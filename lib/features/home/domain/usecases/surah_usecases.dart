import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';
import 'package:alquran_api/features/home/domain/repos/quran_repository.dart';

class SurahUsecases {
  final QuranRepository quranRepository;

  SurahUsecases(this.quranRepository);

  Future<List<SurahEntity>> getSurah() async {
    return quranRepository.getSurah();
  }
}
