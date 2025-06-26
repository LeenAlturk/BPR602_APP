
import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:bpr602_cinema/models/response/snackresponse_byid.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart';
import 'package:dio/dio.dart';

class Getsnacks extends BaseClient {
  
///new internet
Future<SnackResponse> getalsnacks({
  String searchQuery = '',
  int pageIndex = 0,
  int pageSize = 10,
  String ? type,
}) async {
  Map<String, dynamic> headers = {
    'Authorization': "Bearer ${DataStore.instance.token}",
    'accept': '*/*',
  };

  try {
    var response = await client.get(
      LinksUrl.getsnacks,
      queryParameters: {
        'SearchQuery': searchQuery,
        'PageIndex': pageIndex,
        'PageSize': pageSize,
        'SnakType':type,
      
      },
      options: Options(headers: headers),
    );
    print(response.data);
    return SnackResponse.fromJson(response.data);
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

          return getalsnacks();
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return SnackResponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return SnackResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return SnackResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return SnackResponse(message: 'No Internet Connection', success: false);
            }
            return SnackResponse(message: 'Something went wrong');
          }
          return SnackResponse(message: 'Something went wrong');
        }
      }

      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return SnackResponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return SnackResponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return SnackResponse(message: 'No Internet Connection', success: false);
      }
      return SnackResponse(message: 'Something went wrong');
    } else {
      return SnackResponse(message: 'Something went wrong');
    }
  }
}
//SnackResponsebyid
Future<SnackResponsebyid> getmsnacksdetailse(int hallid ) async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Snak/$hallid',
          //queryParameters: {"id": hallid},
          options: Options(headers: headers));
      print(response.data);
      return SnackResponsebyid.fromJson(response.data);
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

          return getmsnacksdetailse(hallid);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return SnackResponsebyid(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return SnackResponsebyid(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return SnackResponsebyid(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return SnackResponsebyid(message: 'No Internet Connection', success: false);
            }
            return SnackResponsebyid(message: 'Something went wrong');
          }
          return SnackResponsebyid(message: 'Something went wrong');
        }
      }

      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return SnackResponsebyid(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return SnackResponsebyid(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return SnackResponsebyid(message: 'No Internet Connection', success: false);
      }
      return SnackResponsebyid(message: 'Something went wrong');
    } else {
      return SnackResponsebyid(message: 'Something went wrong');
    }
  }
  }
}