part of 'images_bloc.dart';

@freezed
class ImagesEvent with _$ImagesEvent {
  const factory ImagesEvent.fetchImages() = FetchImages;
  
}