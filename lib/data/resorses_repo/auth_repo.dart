import 'dart:io';

import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/Login_Request.dart';
import 'package:bpr602_cinema/models/request/change_passPresponse.dart';
import 'package:bpr602_cinema/models/request/cheakemail_req.dart';
import 'package:bpr602_cinema/models/request/confirm_emailreg_request.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/request/register_request.dart';
import 'package:bpr602_cinema/models/request/resendrequest.dart';
import 'package:bpr602_cinema/models/request/resetpasswordreq.dart';
import 'package:bpr602_cinema/models/response/Login_response.dart';
import 'package:bpr602_cinema/models/response/changepassword_resp.dart';
import 'package:bpr602_cinema/models/response/cheakemail_response.dart';
import 'package:bpr602_cinema/models/response/confirmEmail_response.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:bpr602_cinema/models/response/register_response_model.dart';
import 'package:bpr602_cinema/models/response/resendresponse.dart';
import 'package:bpr602_cinema/models/response/resetpasswordresp.dart';
import 'package:dio/dio.dart';

class Authrepo extends BaseClient {
   Future<CustomerRegisterRsponse> registerRepo(
      CustomerRegister registerStudentModel) async {
    try {
      var response =
          await client.post(LinksUrl.registerUrl, data: registerStudentModel  , options: Options(
          headers: {
            'Content-Type': 'application/json',  
          },
        ),
);
      print(response.data);
      return CustomerRegisterRsponse.fromJson(response.data);
    } catch (ex) {
      // if (ex is DioException) {
      //   if (ex.response!.statusCode == 500) {
      //     return CustomerRegisterRsponse(
      //         success: false, message: "Internal Server Error", );
      //   } else if (ex.response!.statusCode == 400) {
      //     //return CustomerRegisterRsponse.fromJson(ex.response!.data);
      //     return CustomerRegisterRsponse(message: ex.response!.data['message'], success: false, );
      //   } else if (ex.type == DioExceptionType.connectionTimeout) {
      //     return CustomerRegisterRsponse(
      //         success: false, message: 'Internet is week');
      //   } else if (ex.type == DioExceptionType.receiveTimeout) {
      //     return CustomerRegisterRsponse(
      //         success: false, message: 'Internet is week');
      //   }if (ex.type == DioExceptionType.connectionError || 
      //     (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
      //   return CustomerRegisterRsponse(message: 'No Internet Connection', success: false);
      // } else {
      //     return CustomerRegisterRsponse(
      //         success: false, message: "Some thing Error");
      //   }
      // } else {
      //   return CustomerRegisterRsponse(
      //       success: false, message: "Try Again");
      // }
       if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return CustomerRegisterRsponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return CustomerRegisterRsponse(message: 'Internet is Weak' , success: false);
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return CustomerRegisterRsponse(message: 'No Internet Connection', success: false);
            }
                  return CustomerRegisterRsponse(
              message: ex.response!.data['message'], success: false);
          }
          return CustomerRegisterRsponse(message: 'Somethings went wrong' , success: false);
    }
  }
Future<ConfirmEmailResponse> sendCode(SendOtpModel sendOtpModel) async {
    try {
      var response = await client.post(LinksUrl.confirmEmail, options: Options(
          headers: {
             'accept': '*/*',
          },
        ),queryParameters: {
        "email": sendOtpModel.email,
        "OtpCode": sendOtpModel.OtpCode
      });
      print(response.data);
      return ConfirmEmailResponse.fromJson(response.data);
    } catch (ex) {
      // if (ex is DioException) {
      //   if (ex.response!.statusCode == 500) {
      //     return ConfirmEmailResponse(
      //         success: false, message: "Internal Server Error");
      //   } else if (ex.response!.statusCode == 400) {
      //     return ConfirmEmailResponse(message: ex.response!.data['message'], );
      //   } else if (ex.type == DioExceptionType.connectionTimeout) {
      //     return ConfirmEmailResponse(
      //         success: false, message: 'Internet is week');
      //   } else if (ex.type == DioExceptionType.receiveTimeout) {
      //     return ConfirmEmailResponse(
      //         success: false, message: 'Internet is week');
      //   } else {
      //     return ConfirmEmailResponse(
      //         success: false, message: "Some thing Error");
      //   }
      // } else {
      //   return ConfirmEmailResponse(success: false, message: "Try Again");
      // }
      if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ConfirmEmailResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ConfirmEmailResponse(message: 'Internet is Weak' , success: false);
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ConfirmEmailResponse(message: 'No Internet Connection', success: false);
            }
                  return ConfirmEmailResponse(
              message: ex.response!.data['message'], success: false);
          }
          return ConfirmEmailResponse(message: 'Somethings went wrong' , success: false);
    }
  }

  Future<ResendResponse> resendCode(ReSendOtpModel rsendOtpModel) async {
    try {
      var response = await client.post(LinksUrl.reSendCode,  options: Options(
          headers: {
             
             'accept': '*/*',
          },
        ),queryParameters: {
        "email":rsendOtpModel.email,
      });
      print(response.data);
      return ResendResponse.fromJson(response.data);
    } catch (ex) {
      // if (ex is DioException) {
      //   if (ex.response!.statusCode == 500) {
      //     return ResendResponse(
      //         success: false, message: "Internal Server Error");
      //   } else if (ex.response!.statusCode == 400) {
      //     ResendResponse response =
      //         ResendResponse.fromJson(ex.response!.data);
      //     return ResendResponse(message: response.message, success: false);
      //   } else if (ex.type == DioExceptionType.connectionTimeout) {
      //     return ResendResponse(
      //         success: false, message: 'Internet is week');
      //   } else if (ex.type == DioExceptionType.receiveTimeout) {
      //     return ResendResponse(
      //         success: false, message: 'Internet is week');
      //   } else {
      //     return ResendResponse(
      //         success: false, message: "Some thing Error");
      //   }
      // } else {
      //   return ResendResponse(success: false, message: "Try Again");
      // }
      if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ResendResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ResendResponse(message: 'Internet is Weak' , success: false);
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ResendResponse(message: 'No Internet Connection', success: false);
            }
                  return ResendResponse(
              message: ex.response!.data['message'], success: false);
          }
          return ResendResponse(message: 'Somethings went wrong' , success: false);
    }
  }

  //login 
  Future<LoginResponse> logIn(LoginRequest logInModel) async {
    try {
      var response = await client.post(LinksUrl.logIn, data: logInModel ,  options: Options(
          headers: {
            'Content-Type': 'application/json',  
                 'accept': '*/*',
          },
        ),);
      print(response.data);
      return LoginResponse.fromJson(response.data);
    } catch (ex) {
      if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return LoginResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return LoginResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return LoginResponse(message: 'No Internet Connection', success: false);
            }
                  return LoginResponse(
              message: ex.response!.data['message'], success: false);
          }
          return LoginResponse(message: 'Somethings went wrong');
    }
  }

//end login
///add sucess when 400
    Future<CheakemailResponse> sendEmailReSetPassword(
      cheackemail cheackemailinst) async {
    try {
      var response = await client.post(LinksUrl.sendResetPasswordCode,
          queryParameters: {"email": cheackemailinst.email});

      return CheakemailResponse.fromJson(response.data);
    } catch (ex) {
      // if (ex is DioException) {
      //   if (ex.response!.statusCode == 500) {
      //     return CheakemailResponse(
      //         success: false, message: "Internal Server Error");
      //   } else if (ex.response!.statusCode == 400) {
      //     return CheakemailResponse(message: ex.response!.data['message'],success: false);
      //   } else if (ex.type == DioExceptionType.connectionTimeout) {
      //     return CheakemailResponse(
      //         success: false, message: 'Internet is week');
      //   } else if (ex.type == DioExceptionType.receiveTimeout) {
      //     return CheakemailResponse(
      //         success: false, message: 'Internet is week');
      //   } else {
      //     return CheakemailResponse(
      //         success: false, message: "Some thing Error");
      //   }
      // } else {
      //   return CheakemailResponse(success: false, message: "Try Again");
      // }
      if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return CheakemailResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return CheakemailResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return CheakemailResponse(message: 'No Internet Connection', success: false);
            }
                  return CheakemailResponse(
              message: ex.response!.data['message'], success: false);
          }
          return CheakemailResponse(message: 'Somethings went wrong');
    }
  }

// ResetpasswordResponse
  Future<ResetpasswordResponse> resetpassword(
      ResetpasswordRequest resetpasswordRequest) async {
    try {
      var response =
          await client.post(LinksUrl.reSetPassword, data: resetpasswordRequest , options: Options(
          headers: {
            'Content-Type': 'application/json',  
                 'accept': '*/*',
          },
        ),);

      return ResetpasswordResponse.fromJson(response.data);
    } catch (ex) {
      // if (ex is DioException) {
      //   if (ex.response!.statusCode == 500) {
      //     return ResetpasswordResponse(
      //         success: false, message: "Internal Server Error");
      //   } else if (ex.response!.statusCode == 400) {
      //     ResetpasswordResponse response =
      //         ResetpasswordResponse.fromJson(ex.response!.data);
      //     return ResetpasswordResponse(
      //         success: false, message: response.message);
      //   } else if (ex.type == DioExceptionType.connectionTimeout) {
      //     return ResetpasswordResponse(
      //         success: false, message: 'Internet is week');
      //   } else if (ex.type == DioExceptionType.receiveTimeout) {
      //     return ResetpasswordResponse(
      //         success: false, message: 'Internet is week');
      //   } else {
      //     return ResetpasswordResponse(
      //         success: false, message: "Some thing Error");
      //   }
      // } else {
      //   return ResetpasswordResponse(success: false, message: "Try Again");
      // }
      if (ex is DioException) {
              
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ResetpasswordResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ResetpasswordResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ResetpasswordResponse(message: 'No Internet Connection', success: false);
            }
                  return ResetpasswordResponse(
              message: ex.response!.data['message'], success: false);
          }
          return ResetpasswordResponse(message: 'Somethings went wrong');
    }
  }


//change pass
Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changepasswordres) async {
    try {
      var response = await client.post(LinksUrl.changepassword, data: changepasswordres , options: Options( headers: {
             'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
      'Content-Type': 'application/json',
    
          },));
      
      return ChangePasswordResponse.fromJson(response.data);
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

          return  changePassword(changepasswordres);
        } catch (ex) {
          if (ex is DioException) {
            if (ex.response?.statusCode == 401) {
              return ChangePasswordResponse(message: 'Session Is Done', success: false);
            }
            if (ex.type == DioExceptionType.connectionTimeout) {
              return ChangePasswordResponse(message: 'Internet is Weak', success: false);
            }
            if (ex.type == DioExceptionType.receiveTimeout) {
              return ChangePasswordResponse(message: 'Internet is Weak');
            }
            if (ex.type == DioExceptionType.connectionError || 
                (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
              return ChangePasswordResponse(message: 'No Internet Connection', success: false);
            }
            return ChangePasswordResponse(
              message: ex.response!.data['message'], success: false);
          }
          return ChangePasswordResponse(message: 'Something went wrong');
        }
      }

      // هذا الجزء بعد محاولة تجديد التوكن
      if (ex.type == DioExceptionType.connectionTimeout) {
        return ChangePasswordResponse(message: 'Internet is Weak', success: false);
      }
      if (ex.type == DioExceptionType.receiveTimeout) {
        return ChangePasswordResponse(message: 'Internet is Weak');
      }
      if (ex.type == DioExceptionType.connectionError || 
          (ex.type == DioExceptionType.unknown && ex.error is SocketException)) {
        return ChangePasswordResponse(message: 'No Internet Connection', success: false);
      }
        return ChangePasswordResponse(
              message: ex.response!.data['message'], success: false);
    } else {
      return ChangePasswordResponse(message: 'Something went wrong');
    }
  }
  }

}