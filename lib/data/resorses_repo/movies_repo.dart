import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';
class GetMovieallinfoRepo extends BaseClient {

  Future<GetMovieTypemodel> gemovietype(
      ) async {
    Map<String, dynamic> headers = {
      'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      var response = await client.get(LinksUrl.movieType ,
          queryParameters: {
            'SearchQuery': " ",
            "PageIndex" : 0,
            'PageSize': 100,
       
          },
          options: Options(headers: headers));
      print(response.data);
      return GetMovieTypemodel.fromJson(response.data);
    } catch (ex) {
      if (ex is DioException) {
        if (ex.response!.statusCode == 401) {
          try {
            RefreshRequest refreshTokenModel = RefreshRequest(
              accessToken: DataStore.instance.token,
              refreshToken: DataStore.instance.getrefreshToken,
            );
            var refreshToken = await client.post(LinksUrl.refreshToken,
                data: refreshTokenModel.toJson());
            RefreshResponse reafreshTokenModel =
                RefreshResponse.fromJson(refreshToken.data);
            DataStore.instance.setToken(reafreshTokenModel.data.accessToken);
            DataStore.instance
                .setRefreshToken(reafreshTokenModel.data.refreshToken);

            return gemovietype();
          } catch (ex) {
            if (ex is DioException) {
              if (ex.response!.statusCode == 401) {
             
                return GetMovieTypemodel(message: 'Session Is Done' , success: false);
                
              }
              if (ex.type == DioExceptionType.connectionTimeout) {
                return GetMovieTypemodel(message: 'Internet is Week' , success: false);
              }
              if (ex.type == DioExceptionType.receiveTimeout) {
                return GetMovieTypemodel(message: 'Internet is Week');
              }
              if (ex.type == DioExceptionType.unknown) {
                return GetMovieTypemodel(message: 'Some Things Error');
              } else {
                return GetMovieTypemodel(message: 'Some Things Error');
              }
            }
          }
        }
        if (ex.type == DioExceptionType.connectionTimeout) {
          return GetMovieTypemodel(message: 'Internet is Week' , success: false);
        }
        if (ex.type == DioExceptionType.receiveTimeout) {
          return GetMovieTypemodel(message: 'Internet is Week');
        }
        if (ex.type == DioExceptionType.unknown) {
          return GetMovieTypemodel(message: 'Some Things Error');
        } else {
          return GetMovieTypemodel(message: 'Some Things Error');
        }
      } else {
        return GetMovieTypemodel(message: 'Some Things Error');
      }
    }
  }
}