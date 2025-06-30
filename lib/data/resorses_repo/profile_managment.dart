import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/putprofile.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/editprofileresponse.dart';
import 'package:bpr602_cinema/models/response/profile_response.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';

class ProfileManagmentRepo extends BaseClient {
  

  Future<ProfileRresponse> getProfile() async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Auth/users/${DataStore.instance.userID}',
          
          options: Options(headers: headers));
      print(response.data);
      return ProfileRresponse.fromJson(response.data);
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

          return getProfile();
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return ProfileRresponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ProfileRresponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ProfileRresponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ProfileRresponse(message: 'No Internet Connection', success: false);
            }
            return ProfileRresponse(message: 'Something went wrong');
          }
          return ProfileRresponse(message: 'Something went wrong');
        }
      }
   
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return ProfileRresponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return ProfileRresponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return ProfileRresponse(message: 'No Internet Connection', success: false);
      }
      return ProfileRresponse(message: 'Something went wrong');
    } else {
      return ProfileRresponse(message: 'Something went wrong');
    }
  }
  }
  Future<EditProfileRresponse> changeProfile(
      UpdateProfileRequest updateProfileRequest) async {
    try {
   FormData formData = FormData.fromMap(updateProfileRequest.toMap());

var response = await client.put(
  "http://cinemate-001-site1.jtempurl.com/api/Auth/update-user/${DataStore.instance.userID}", 
  data: formData,
  options: Options(
    headers: {
      'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
      'Content-Type': 'multipart/form-data',
    },
  ),
);
      
      return EditProfileRresponse.fromJson(response.data);
    } 

catch (ex) {
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

          return  changeProfile(updateProfileRequest);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return EditProfileRresponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return EditProfileRresponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return EditProfileRresponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return EditProfileRresponse(message: 'No Internet Connection', success: false);
            }
            return EditProfileRresponse(
              message: ex.response!.data['message'], success: false);
          }
          return EditProfileRresponse(message: 'Something went wrong');
        }
      }
    if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return EditProfileRresponse(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return EditProfileRresponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return EditProfileRresponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return EditProfileRresponse(message: 'No Internet Connection', success: false);
      }
        return EditProfileRresponse(
              message: ex.response!.data['message'], success: false);
    } else {
      return EditProfileRresponse(message: 'Something went wrong');
    }
  }
  }
}