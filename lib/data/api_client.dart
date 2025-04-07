import 'dart:developer';

import 'package:dio/dio.dart';

class ValidationException implements Exception {
  final Map<String, dynamic> errors;

  ValidationException(this.errors);

  @override
  String toString() {
    return errors.toString();
  }
}

class FactoryException implements Exception {
  final data;
  final int code;

  FactoryException(data)
      : this.data = data["message"],
        this.code = data["code"];

  @override
  String toString() {
    if (data is List) {
      return data.join(" ");
    } else {
      return data;
    }
  }
}

class BaseClient {
  static const UNAUTHORIZED = 401;
  static const UNPROCESSABLE = 422;

  Dio client = Dio(
    BaseOptions(
      baseUrl: "https://quizzy-001-site1.atempurl.com",
      receiveDataWhenStatusError: true,
      //connectTimeout: 9000, // 60 seconds
      connectTimeout: Duration(milliseconds: 9000),

      // 60 seconds
    ),
  );

  BaseClient() {
    client.interceptors.add(LogInterceptor());
    // client.interceptors.add(ClientInterceptor());
    client.options.baseUrl = "https://quizzy-001-site1.atempurl.com";
  }
}

class LogInterceptor extends Interceptor {
  static final function = "FUNCTION".padRight(10).padLeft(15);
  static final status = "STATUS".padRight(10).padLeft(15);
  static final error = "ERROR".padRight(10).padLeft(15);
  static final path = "PATH".padRight(10).padLeft(15);
  static final method = "METHOD".padRight(10).padLeft(15);
  static final headers = "HEADERS".padRight(10).padLeft(15);
  static final query = "QUERY".padRight(10).padLeft(15);
  static final body = "BODY".padRight(10).padLeft(15);

  @override
  void onRequest(options, handler) {
    log("---------------------------");

    log("REQUEST", name: function);
    log(options.uri.path, name: path);
    log(options.method, name: method);

    if (options.queryParameters.isNotEmpty) {
      log(options.queryParameters.toString(), name: query);
    }
    if (options.headers.isNotEmpty) {
      log(options.headers.toString(), name: headers);
    }
    if (options.data != null) {
      log(options.data.toString(), name: body);
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("---------------------------");
    log("ERROR", name: function);
    log(err.requestOptions.path, name: path);
    //log(err.message, name: error);
    log(err.toString(), name: error);

    if (err.response != null) {
      log(err.response!.statusCode.toString(), name: status);
      log(err.response!.headers.toString(), name: headers);
      log(err.response!.data.toString(), name: body);
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("---------------------------");
    log("RESPONSE", name: function);
    log(response.realUri.path, name: path);
    log(response.headers.toString(), name: headers);
    log(response.data.toString(), name: body);
    handler.next(response);
  }
}
