import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/register_request.dart';
import 'package:bpr602_cinema/models/response/register_response_model.dart';
import 'package:dio/dio.dart';

class Authrepo extends BaseClient {
  //  Future<ResponseRegisterStudentModel> registerRepo(
  //     RegisterStudentModel registerStudentModel) async {
  //   try {
  //     var response =
  //         await client.post(LinksUrl.registerUrl, data: registerStudentModel);
  //     print(response.data);
  //     return ResponseRegisterStudentModel.fromJson(response.data);
  //   } catch (ex) {
  //     if (ex is DioException) {
  //       if (ex.response!.statusCode == 500) {
  //         return ResponseRegisterStudentModel(
  //             success: false, message: "Internal Server Error");
  //       } else if (ex.response!.statusCode == 400) {
  //         return ResponseRegisterStudentModel.fromJson(ex.response!.data);
  //       } else if (ex.type == DioExceptionType.connectionTimeout) {
  //         return ResponseRegisterStudentModel(
  //             success: false, message: 'Internet is week');
  //       } else if (ex.type == DioExceptionType.receiveTimeout) {
  //         return ResponseRegisterStudentModel(
  //             success: false, message: 'Internet is week');
  //       } else {
  //         return ResponseRegisterStudentModel(
  //             success: false, message: "Some thing Error");
  //       }
  //     } else {
  //       return ResponseRegisterStudentModel(
  //           success: false, message: "Try Again");
  //     }
  //   }
  // }

}