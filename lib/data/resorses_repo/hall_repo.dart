
import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/hallResponse.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class GeHallRepo extends BaseClient {
  Future<GetHallId> getHall(int hallid ,DateTime bookingDate) async {
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
      final formattedDate = DateFormat('yyyy-MM-dd').format(bookingDate);
    try {
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Bookings/$hallid/booking-hall-chairs',
          queryParameters: {"bookingDate": formattedDate},
          options: Options(headers: headers));
      print(response.data);
      return GetHallId.fromJson(response.data);
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
          

          return getHall(hallid , bookingDate);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return GetHallId(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return GetHallId(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return GetHallId(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return GetHallId(message: 'No Internet Connection', success: false);
            }
            return GetHallId(message: 'Something went wrong');
          }
          return GetHallId(message: 'Something went wrong');
        }
      }

      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return GetHallId(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return GetHallId(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return GetHallId(message: 'No Internet Connection', success: false);
      }
      return GetHallId(message: 'Something went wrong');
    } else {
      return GetHallId(message: 'Something went wrong');
    }
  }
  }
}


// class GeHallRepo extends BaseClient {
//   Future<GetHallId> getHall(int hallid) async {
//     Map<String, dynamic> headers = {
//       "Authorization": "Bearer ${DataStore.instance.token}",
//       'accept': '/',
//       // 'Content-Type': 'application/json',
//       // 'Accept': 'application/json',
//     };

//     try {
//       var response = await client.get(
//         'http://cinemate-001-site1.jtempurl.com/api/Hall/$hallid',
//         options: Options(headers: headers),
//       );
//       print(response.data);
//       return GetHallId.fromJson(response.data);
//     } catch (ex) {
//       if (ex is DioException) {
//         // حالة توكن منتهي - 401
//         if (ex.response?.statusCode == 401) {
//           try {
//             // طلب تجديد التوكن مع validateStatus لمنع رمي الاستثناء في حالة 401
//              RefreshRequest refreshTokenModel = RefreshRequest(
//               accessToken: DataStore.instance.token,
//               refreshToken: DataStore.instance.getrefreshToken,
//      );

//             var refreshTokenResponse = await client.post(
//               LinksUrl.refreshToken,
//               data: refreshTokenModel.toJson(),
//               options: Options(
//                 validateStatus: (status) => status != null && status < 500,
//               ),
//             );

//             if (refreshTokenResponse.statusCode == 401) {
//               // توكن التجديد منتهي او غير صالح
//               return GetHallId(message: 'Session Is Done', success: false);
//             }

//             // تحديث التوكنات في DataStore
//             RefreshResponse refreshResponseModel =
//                 RefreshResponse.fromJson(refreshTokenResponse.data);

//             await DataStore.instance.setToken(refreshResponseModel.data.accessToken);
//             await DataStore.instance.setRefreshToken(refreshResponseModel.data.refreshToken);

//             // إعادة المحاولة بعد تحديث التوكن
//             return getHall(hallid);
//           } catch (refreshEx) {
//             if (refreshEx is DioException) {
//               if (refreshEx.response?.statusCode == 401) {
//                 return GetHallId(message: 'Session Is Done', success: false);
//               }
//               if (refreshEx.type == DioExceptionType.connectionTimeout ||
//                   refreshEx.type == DioExceptionType.receiveTimeout) {
//                 return GetHallId(message: 'Internet is Weak', success: false);
//               }
//               if (refreshEx.type == DioExceptionType.unknown) {
//                 return GetHallId(message: 'Something went wrong');
//               }
//               return GetHallId(message: 'Something went wrong');
//             }
//             return GetHallId(message: refreshEx.toString());
//           }
//         }

//         // باقي أخطاء الاتصال وغيرها
//         if (ex.type == DioExceptionType.connectionTimeout ||
//             ex.type == DioExceptionType.receiveTimeout) {
//           return GetHallId(message: 'Internet is Weak', success: false);
//         }
//         if (ex.type == DioExceptionType.unknown) {
//           return GetHallId(message: 'Something went wrong');
//         }
//         return GetHallId(message: 'Something went wrong');
//       }
//       return GetHallId(message: 'Something went wrong');
//     }
//   }
// }
