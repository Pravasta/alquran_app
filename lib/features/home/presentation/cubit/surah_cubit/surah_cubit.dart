import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';
import 'package:alquran_api/features/home/domain/usecases/surah_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.surahUsecases) : super(SurahInitial());

  final SurahUsecases surahUsecases;

  void getSurah() async {
    try {
      emit(SurahLoading());
      final surah = await surahUsecases.getSurah();
      emit(SurahSucces(surah));
    } catch (e) {
      emit(SurahFailed(e.toString()));
    }
  }
}
