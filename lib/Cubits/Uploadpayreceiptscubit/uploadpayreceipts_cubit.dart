import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/data/resorses_repo/image_repo.dart';
import 'package:bpr602_cinema/models/request/imagerequest.dart';
import 'package:bpr602_cinema/models/response/imageResponse.dart';
import 'package:bpr602_cinema/models/response/imageresponsedel.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';
part 'uploadpayreceipts_state.dart';

class UploadpayreceiptsCubit extends Cubit<UploadpayreceiptsState> {
  UploadpayreceiptsCubit() : super(UploadpayreceiptsInitial());
   XFile? image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      image = selectedImage;
      emit(PayRecImagePicked(image: selectedImage));
    }
    
  }
  Future<void> uploadImage() async {
    if (image == null) {
      emit(UploadImageFailure(message: 'No photo selected '));
      return;
    }

    emit(UploadImageInProgress());

  

    ImageRequest imageRequest = ImageRequest(
      image: image,  
      url: null,  
      title: ' title',
    );

    try {
     
      ImageResponse response = await GetIt.I
          .get<Imagerepo>() 
          .uploadimage(imageRequest);  

      if (response.success == true) {
          int? imageId = response.data!.id; 
        emit(UploadImageSuccess(response: response , imageId: imageId!)); 
      } else {
        emit(UploadImageFailure(message: response.message ?? 'UNKNOUN ERROR'));
      }
    } catch (e) {
      emit(UploadImageFailure(message: ' UN ERROR HAPINING WHEN UPLOAD   '));
    }
  }

//delete function :
Future<void> deleteImage(int imageId) async {
    emit(DelImageInProgress());  
    try {
      ImageDelResponse response = await GetIt.I
          .get<Imagerepo>()
          .deleteimage(imageId);

 if (response.success == true) {
   image = null;
        emit(deleteImageSuccess(response: response)); 
      } else {
        emit(DeleteImageFailure(message: response.message ?? 'UNKNOUN ERROR'));
      }
    } catch (e) {
      emit(DeleteImageFailure(message: ' UN ERROR HAPINING WHEN UPLOAD   '));
    }
  }

}
