import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/api_client.dart';
import 'package:bpr602_cinema/data/link.dart';
import 'package:bpr602_cinema/models/request/imagerequest.dart';
import 'package:bpr602_cinema/models/request/refreshreq.dart';
import 'package:bpr602_cinema/models/response/imageResponse.dart';
import 'package:bpr602_cinema/models/response/imageresponsedel.dart';
import 'package:bpr602_cinema/models/response/refreshresponse.dart';
import 'package:dio/dio.dart';

class Imagerepo extends BaseClient {

Future<ImageResponse> uploadimage(
      ImageRequest imageRequest) async {
    try {
      final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        imageRequest.image!.path,
        filename: imageRequest.image!.name,
      ),
      'title': imageRequest.title,
      'url': imageRequest.url,
    });

      var response = await client.post(LinksUrl.imagepost, data: formData , options: Options(
          headers: {
            
            'Authorization': "Bearer ${DataStore.instance.token}",
      'accept': '*/*',
      'Content-Type': ' multipart/form-data',
          },
        ),);
      
      return ImageResponse.fromJson(response.data);
    } catch (ex) {
      if (ex is DioException) {
        
        // if (ex.response!.statusCode == 500) {
        //   return ImageResponse(
        //       success: false, message: "Internal Server Error");
        // } else if (ex.response!.statusCode == 400) {
        //   return ImageResponse.fromJson(ex.response!.data);
        // } else if (ex.type == DioExceptionType.connectionTimeout) {
        //   return ImageResponse(
        //       success: false, message: 'Internet is week');
        // } else if (ex.type == DioExceptionType.receiveTimeout) {
        //   return ImageResponse(
        //       success: false, message: 'Internet is week');
        // } else {
        //   return ImageResponse(
        //       success: false, message: "Some thing Error");
        // }
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
            
            return uploadimage(imageRequest);
          } catch (ex) {
            if (ex is DioException) {
              if (ex.response!.statusCode == 401) {
                return ImageResponse(message: 'Session Is Done');
              }
              if (ex.type == DioExceptionType.connectionTimeout) {
                return ImageResponse(message: 'Internet is Week');
              }
              if (ex.type == DioExceptionType.receiveTimeout) {
                return ImageResponse(message: 'Internet is Week');
              }
              if (ex.type == DioExceptionType.unknown) {
                return ImageResponse(message: 'Some Things Error');
              } else {
                return ImageResponse(message: 'Some Things Error');
              }
            }
          }
        }
        if (ex.type == DioExceptionType.connectionTimeout) {
          return ImageResponse(message: 'Internet is Week');
        }
        if (ex.type == DioExceptionType.receiveTimeout) {
          return ImageResponse(message: 'Internet is Week');
        }
        if (ex.type == DioExceptionType.unknown) {
          return ImageResponse(message: 'Some Things Error');
        } else {
          return ImageResponse(message: 'Some Things Error');
        }
      } else {
        return ImageResponse(success: false, message: "Try Again");
      }
    }
  }



  //delete




Future<ImageDelResponse> deleteimage(int imageId) async {
  try {
 
    String url = '${LinksUrl.baseUrl}${LinksUrl.deleteImage(imageId)}';

    var response = await client.delete(
      url,
      options: Options(
        headers: {
          'Authorization': "Bearer ${DataStore.instance.token}",
          'accept': '*/*',
        },
      ),
    );

    return ImageDelResponse.fromJson(response.data);
  } catch (ex) {
    if (ex is DioException) {
      // if (ex.response?.statusCode == 500) {
      //   return ImageDelResponse(success: false, message: "Internal Server Error");
      // } else if (ex.response?.statusCode == 400) {
      //   return ImageDelResponse.fromJson(ex.response!.data);
      // } else if (ex.type == DioExceptionType.connectionTimeout ||
      //     ex.type == DioExceptionType.receiveTimeout) {
      //   return ImageDelResponse(success: false, message: 'Internet is weak');
      // } else {
      //   return ImageDelResponse(success: false, message: "Something went wrong");
      // }
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
              

            return deleteimage(imageId);
          } catch (ex) {
            if (ex is DioException) {
              if (ex.response!.statusCode == 401) {
                return ImageDelResponse(message: 'Session Is Done');
              }
              if (ex.type == DioExceptionType.connectionTimeout) {
                return ImageDelResponse(message: 'Internet is Week');
              }
              if (ex.type == DioExceptionType.receiveTimeout) {
                return ImageDelResponse(message: 'Internet is Week');
              }
              if (ex.type == DioExceptionType.unknown) {
                return ImageDelResponse(message: 'Some Things Error');
              } else {
                return ImageDelResponse(message: 'Some Things Error');
              }
            }
          }
        }
        if (ex.type == DioExceptionType.connectionTimeout) {
          return ImageDelResponse(message: 'Internet is Week');
        }
        if (ex.type == DioExceptionType.receiveTimeout) {
          return ImageDelResponse(message: 'Internet is Week');
        }
        if (ex.type == DioExceptionType.unknown) {
          return ImageDelResponse(message: 'Some Things Error');
        } else {
          return ImageDelResponse(message: 'Some Things Error');
        }
    } else {
      return ImageDelResponse(success: false, message: "Try Again");
    }
       


    
  }
}


}

