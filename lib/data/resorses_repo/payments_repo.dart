import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/getpayments.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:bpr602_cinema/models/response/response_put_payment.dart';
import 'package:dio/dio.dart';

class PaymentsRepo extends BaseClient {

Future<Getpayment> getpayment(
   String? status,
 ) async {
  
    Map<String, dynamic> headers = {
      "Authorization": "Bearer ${DataStore.instance.token}",
      'accept': '/',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    };
    try {
      
      var response = await client.get('http://cinemate-001-site1.jtempurl.com/api/Payment',
          queryParameters: {"PaymentStatus": status  , "UserId" : DataStore.instance.userID},
          options: Options(headers: headers));
      print(response.data);
      return Getpayment.fromJson(response.data);
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
          

          return getpayment(status);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return Getpayment(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return Getpayment(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return Getpayment(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return Getpayment(message: 'No Internet Connection', success: false);
            }
            return Getpayment(message: 'Something went wrong');
          }
          return Getpayment(message: 'Something went wrong');
        }
      }
         if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return Getpayment(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return Getpayment(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return Getpayment(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return Getpayment(message: 'No Internet Connection', success: false);
      }
      return Getpayment(message: 'Something went wrong');
    } else {
      return Getpayment(message: 'Something went wrong');
    }
  }
  }

//payment
 Future<ResponseGetPayment> uploadrecipt(
  int ? paymentid,
  int ?imageId
     ) async {
    try {
   

var response = await client.put(
  "http://cinemate-001-site1.jtempurl.com/api/Payment/$paymentid", 
  queryParameters: {"Status" :"Pending" , "ImageId" : imageId },
  options: Options(
    headers: {
      'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
      
    },
  ),
);
      
      return ResponseGetPayment.fromJson(response.data);
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

          return  uploadrecipt(paymentid , imageId);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return ResponseGetPayment(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ResponseGetPayment(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ResponseGetPayment(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ResponseGetPayment(message: 'No Internet Connection', success: false);
            }
            return ResponseGetPayment(
              message: ex.response!.data['message'], success: false);
          }
          return ResponseGetPayment(message: 'Something went wrong');
        }
      }
    if (ex.response?.data != null &&
          ex.response?.data is Map &&
          ex.response?.data['message'] != null) {
        return ResponseGetPayment(message: ex.response!.data['message'], success: false);
      }
      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return ResponseGetPayment(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return ResponseGetPayment(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return ResponseGetPayment(message: 'No Internet Connection', success: false);
      }
        return ResponseGetPayment(
              message: ex.response!.data['message'], success: false);
    } else {
      return ResponseGetPayment(message: 'Something went wrong');
    }
  }
  }
}