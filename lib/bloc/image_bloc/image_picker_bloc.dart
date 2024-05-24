import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/image_bloc/image_picker_event.dart';
import 'package:bloc_state_management/bloc/image_bloc/image_picker_state.dart';
import 'package:bloc_state_management/util/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<CameraPicker>(cameraPicker);
    on<ImageFromGallery>(imageFromGallery);
  }

  void cameraPicker(CameraPicker event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await ImagePickerUtils.cameraPicker();
    emit(ImagePickerState(file: file));
  }

  void imageFromGallery(
      ImageFromGallery event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await ImagePickerUtils.imageFromGallery();
    emit(ImagePickerState(file: file));
  }
}
