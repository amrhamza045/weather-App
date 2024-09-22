import 'package:dio/dio.dart';
import 'package:weather_app/models/search_model.dart';

class SearchService {
  final Dio dio;
  SearchService(this.dio);
  Future<List<SearchModel>> getSearch({required String search}) async {
    try {
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/search.json',
        queryParameters: {
          'key': '6151a5cfbf0d4244ba094814241609',
          'q': search,
        },
      );
      List<SearchModel> searchlist = [];
      for (int i = 0; i < response.data.length; i++) {
        searchlist.add(SearchModel.fromJson(response.data[i]));
      
      }
      return searchlist;
    } on DioException catch (e) {
      // ignore: avoid_print
      print(e.response?.data['error']['message'] ?? 'Unknown Error');
      throw (e.response?.data['error']['message'] ?? 'Unknown Error');
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      throw Exception('Unknown Error');
    }
  }
}
