import 'package:alquran_api/common/endpoint/app_endpoint.dart';
import 'package:alquran_api/common/exception/server_exception.dart';
import 'package:alquran_api/features/home/data/models/detail_surah_model.dart';
import 'package:alquran_api/features/home/data/models/surah_model.dart';
import 'package:http/http.dart' as http;

abstract class QuranRemoteDatasource {
  Future<List<SurahModel>> getSurahModel();
  Future<DetailSurahModel> getDetailSurahModel(int surah);
}

class QuranRemoteDatasourceImpl implements QuranRemoteDatasource {
  final http.Client client;
  final AppEndPoint appEndPoint;

  QuranRemoteDatasourceImpl({required this.client, required this.appEndPoint});

  @override
  Future<DetailSurahModel> getDetailSurahModel(int surah) async {
    final url = appEndPoint.getQuranSurahDetail(surah);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return DetailSurahResponse.fromJson(response.body).data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SurahModel>> getSurahModel() async {
    final url = appEndPoint.getQuranSurah();
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return SurahModelResponse.fromJson(response.body).data;
    } else {
      throw ServerException();
    }
  }
}
