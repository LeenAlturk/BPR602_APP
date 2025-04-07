import 'package:bloc/bloc.dart';
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
}
