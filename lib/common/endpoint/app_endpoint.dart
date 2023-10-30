import 'package:alquran_api/common/endpoint/uri_helper.dart';

class AppEndPoint {
  final String _baseUrl;

  AppEndPoint(this._baseUrl);

  Uri getQuranSurah() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "api/v2/surat",
    );
  }

  Uri getQuranSurahDetail(int surah) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'api/v2/surat/$surah',
    );
  }
}
