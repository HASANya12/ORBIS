import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orbis/domain/busineslogic/imagrpicker/imagepicker_state.dart';

class ImagepickerCubit extends Cubit<ImageState> {
  ImagepickerCubit()
    : super(
        ImageInitial(
          File(
            "C:UsersyarooStudioProjectsORBISorbisassetsimagescloud.png",
          ),
        ),
      );

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImagefromegallery() async {
    emit(
      ImageLoading(
        File(
          "C:UsersyarooStudioProjectsORBISorbisassetsimagescloud.png",
        ),
      ),
    );
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        print(pickedFile.path);
        emit(ImageLoaded(File(pickedFile.path)));
      } else {
        emit(ImageError('No image selected', File("assets/images/cloudw.png")));
      }
    } catch (e) {
      emit(ImageError(e.toString(), File("assets/images/cloudw.png")));
    }
  }

  Future<void> pickImagefromecamera() async {
    emit(ImageLoading(File("assets/images/cloudw.png")));
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        emit(ImageLoaded(File(pickedFile.path)));
      } else {
        emit(ImageError('No image selected', File("assets/images/cloudw.png")));
      }
    } catch (e) {
      emit(ImageError(e.toString(), File("assets/images/cloudw.png")));
    }
  }
}
