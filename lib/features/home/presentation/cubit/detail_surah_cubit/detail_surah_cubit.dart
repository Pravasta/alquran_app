import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:alquran_api/features/home/domain/usecases/detail_surah_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_surah_state.dart';

class DetailSurahCubit extends Cubit<DetailSurahState> {
  DetailSurahCubit(this.detailSurahUsecases) : super(DetailSurahInitial());

  final DetailSurahUsecases detailSurahUsecases;

  void getDetailSurah(int surah) async {
    try {
      emit(DetailSurahLoading());
      final detailSurah = await detailSurahUsecases.getDetailSurah(surah);
      emit(DetailSurahSucces(detailSurah));
    } catch (e) {
      emit(DetailSurahFailed(e.toString()));
    }
  }
}
