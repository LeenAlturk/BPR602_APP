
import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/bookingrequest.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/alluserbooking.dart';
import 'package:bpr602_cinema/models/response/booking_response.dart';
import 'package:bpr602_cinema/models/response/deletebooking.dart';
import 'package:bpr602_cinema/models/response/getbookingbyid.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';



class BookingRepo extends BaseClient {

  Future<Bookingresponse> postbooking(Bookingrequest bookingrequest) async {
  Map<String, dynamic> headers = {
    "Authorization": "Bearer ${DataStore.instance.token}",
    'Content-Type': 'application/json',
    'accept': '*/*',
  };

  try {
    var response = await client.post(
      LinksUrl.postbooking,
      data: bookingrequest.toJson(),
      options: Options(headers: headers),
    );

    return Bookingresponse.fromJson(response.data);
  } catch (ex) {
    if (ex is DioException) {
      // في حال انتهاء التوكن
      if (ex.response?.statusCode == 401) {
        try {
          final refreshModel = RefreshRequest(
            accessToken: DataStore.instance.token,
            refreshToken: DataStore.instance.getrefreshToken,
          );

          final refreshTokenResponse = await client.post(
            LinksUrl.refreshToken,
            data: refreshModel.toJson(),
          );

          final refreshParsed = RefreshResponse.fromJson(refreshTokenResponse.data);
          DataStore.instance.setToken(refreshParsed.data.accessToken);
          DataStore.instance.setRefreshToken(refreshParsed.data.refreshToken);

          // إعادة المحاولة بعد التجديد
          return await postbooking(bookingrequest);
        } catch (e) {
          if (e is DioException && e.response?.statusCode == 401) {
            return Bookingresponse(message: 'Session Is Done', success: false);
          }
          return Bookingresponse(message: 'Something went wrong', success: false);
        }
      }

      // أخطاء الشبكة
      if (ex.type == DioExceptionType.connectionTimeout ||
          ex.type == DioExceptionType.receiveTimeout) {
        return Bookingresponse(message: 'Internet is Weak', success: false);
      }

      if (ex.type == DioExceptionType.connectionError ||
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return Bookingresponse(message: 'No Internet Connection', success: false);
      }

      // رسالة من السيرفر إن وجدت
      if (ex.response?.data != null && ex.response?.data is Map && ex.response?.data['message'] != null) {
        return Bookingresponse(message: ex.response!.data['message'], success: false);
      }

      return Bookingresponse(message: 'Something went wrong', success: false);
    }

    return Bookingresponse(message: 'Something went wrong', success: false);
  }
}

Future<Bookinguserresponse> getallbookinguser({
  int pageIndex = 0,
  int pageSize = 10,
 
}) async {
  Map<String, dynamic> headers = {
    'Authorization': "Bearer ${DataStore.instance.token}",
    'accept': '*/*',
  };

  try {
    var response = await client.get(
      LinksUrl.getuserbooking,
      queryParameters: {
        'PageIndex': pageIndex,
        'PageSize': pageSize,
        'UserID': DataStore.instance.userID,
        
      },
      options: Options(headers: headers),
    );
    print(response.data);
    return Bookinguserresponse.fromJson(response.data);
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

          return getallbookinguser();
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return Bookinguserresponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return Bookinguserresponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return Bookinguserresponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return Bookinguserresponse(message: 'No Internet Connection', success: false);
            }
            return Bookinguserresponse(message: 'Something went wrong');
          }
          return Bookinguserresponse(message: 'Something went wrong');
        }
      }
       if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return Bookinguserresponse(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return Bookinguserresponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return Bookinguserresponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return Bookinguserresponse(message: 'No Internet Connection', success: false);
      }
      return Bookinguserresponse(message: 'Something went wrong');
    } else {
      return Bookinguserresponse(message: 'Something went wrong');
    }
  }
}


Future<Deletebookingresponse> deletebooking(int bookingid) async {
  try {
 
    String url = '${LinksUrl.baseUrl}${LinksUrl.deletebooking(bookingid)}';

    var response = await client.delete(
      url,
      options: Options(
        headers: {
          'Authorization': "Bearer ${DataStore.instance.token}",
          'accept': '*/*',
        },
      ),
    );

    return Deletebookingresponse.fromJson(response.data);
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

          return deletebooking(bookingid);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return Deletebookingresponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return Deletebookingresponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return Deletebookingresponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return Deletebookingresponse(message: 'No Internet Connection', success: false);
            }
            return Deletebookingresponse(message: 'Something went wrong');
          }
          return Deletebookingresponse(message: 'Something went wrong');
        }
      }
       if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return Deletebookingresponse(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return Deletebookingresponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return Deletebookingresponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return Deletebookingresponse(message: 'No Internet Connection', success: false);
      }
      return Deletebookingresponse(message: 'Something went wrong');
    } else {
      return Deletebookingresponse(message: 'Something went wrong');
    }
  }
}
//get booking id 
//GetbookingbyidResponse



Future<GetbookingbyidResponse> getticketdetailse(int userbookingid ) async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Bookings/$userbookingid/ticket',
          //queryParameters: {"id": hallid},
          options: Options(headers: headers));
      print(response.data);
      return GetbookingbyidResponse.fromJson(response.data);
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

          return getticketdetailse(userbookingid);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return GetbookingbyidResponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return GetbookingbyidResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return GetbookingbyidResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return GetbookingbyidResponse(message: 'No Internet Connection', success: false);
            }
            return GetbookingbyidResponse(message: 'Something went wrong');
          }
          return GetbookingbyidResponse(message: 'Something went wrong');
        }
      }
         if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return GetbookingbyidResponse(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return GetbookingbyidResponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return GetbookingbyidResponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return GetbookingbyidResponse(message: 'No Internet Connection', success: false);
      }
      return GetbookingbyidResponse(message: 'Something went wrong');
    } else {
      return GetbookingbyidResponse(message: 'Something went wrong');
    }
  }
  }
}
