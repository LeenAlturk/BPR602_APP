import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
import 'package:bpr602_cinema/models/response/movies_response_model.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';
import 'dart:io';
class GetMovieallinfoRepo extends BaseClient {

  Future<GetMovieTypemodel> gemovietype(
      ) async {
    Map<String, dynamic> headers = {
      'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
     
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
               if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return GetMovieTypemodel(message: 'No Internet Connection', success: false);
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
      if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return GetMovieTypemodel(message: 'No Internet Connection', success: false);
            } else {
          return GetMovieTypemodel(message: 'Some Things Error');
        }
      } else {
        return GetMovieTypemodel(message: 'Some Things Error');
      }
    }
  }

///new internet
Future<MovieResponse> getallmovies({
  String searchQuery = '',
  int pageIndex = 0,
  int pageSize = 10,
  int? movieTypeID,
  String? status,
}) async {
  Map<String, dynamic> headers = {
    'Authorization': "Bearer ${DataStore.instance.token}",
    'accept': '*/*',
  };

  try {
    var response = await client.get(
      LinksUrl.getmovies,
      queryParameters: {
        'SearchQuery': searchQuery,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
        'MovieTypeID': movieTypeID,
        'status': status,
      },
      options: Options(headers: headers),
    );
    print(response.data);
    return MovieResponse.fromJson(response.data);
  } catch (ex) {
    if (ex is DioException) {
      if (ex.response?.statusCode == 401) {
        try {
          RefreshRequest refreshTokenModel = RefreshRequest(
            accessToken: DataStore.instance.token,
            refreshToken: DataStore.instance.getrefreshToken,
          );
          var refreshToken = await client.post(
            LinksUrl.refreshToken,
            data: refreshTokenModel.toJson(),
          );
          RefreshResponse reafreshTokenModel =
              RefreshResponse.fromJson(refreshToken.data);
          DataStore.instance.setToken(reafreshTokenModel.data.accessToken);
          DataStore.instance.setRefreshToken(reafreshTokenModel.data.refreshToken);

          return getallmovies();
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return MovieResponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return MovieResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return MovieResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return MovieResponse(message: 'No Internet Connection', success: false);
            }
            return MovieResponse(message: 'Something went wrong');
          }
          return MovieResponse(message: 'Something went wrong');
        }
      }
if (ex.response?.data != null &&
    ex.response?.data is Map &&
    ex.response?.data['message'] != null) {
  return MovieResponse(message: ex.response!.data['message'], success: false);
}

      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return MovieResponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return MovieResponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return MovieResponse(message: 'No Internet Connection', success: false);
      }
      return MovieResponse(message: 'Something went wrong');
    } else {
      return MovieResponse(message: 'Something went wrong');
    }
  }
}


  //====================================================================
   Future<MovieResponseById> getmoviedetailse(int hallid ) async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
    
    };
    try {
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Movie/$hallid',
          //queryParameters: {"id": hallid},
          options: Options(headers: headers));
      print(response.data);
      return MovieResponseById.fromJson(response.data);
    }catch (ex) {
    if (ex is DioException) {
      if (ex.response?.statusCode == 401) {
        try {
          RefreshRequest refreshTokenModel = RefreshRequest(
            accessToken: DataStore.instance.token,
            refreshToken: DataStore.instance.getrefreshToken,
          );
          var refreshToken = await client.post(
            LinksUrl.refreshToken,
            data: refreshTokenModel.toJson(),
          );
          RefreshResponse reafreshTokenModel =
              RefreshResponse.fromJson(refreshToken.data);
          DataStore.instance.setToken(reafreshTokenModel.data.accessToken);
          DataStore.instance.setRefreshToken(reafreshTokenModel.data.refreshToken);

          return getmoviedetailse(hallid);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return MovieResponseById(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return MovieResponseById(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return MovieResponseById(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return MovieResponseById(message: 'No Internet Connection', success: false);
            }
            return MovieResponseById(message: 'Something went wrong');
          }
          return MovieResponseById(message: 'Something went wrong');
        }
      }

     if (ex.response?.data != null &&
    ex.response?.data is Map &&
    ex.response?.data['message'] != null) {
  return MovieResponseById(message: ex.response!.data['message'], success: false);
}

      if (ex.type == DioExceptionType.connectionTimeout) {
        return MovieResponseById(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return MovieResponseById(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return MovieResponseById(message: 'No Internet Connection', success: false);
      }
      return MovieResponseById(message: 'Something went wrong');
    } else {
      return MovieResponseById(message: 'Something went wrong');
    }
  }
  }
  ///===========================================================================
}
  
