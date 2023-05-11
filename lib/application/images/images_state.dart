part of 'images_bloc.dart';

@freezed
class ImagesState with _$ImagesState {
  const factory ImagesState({
    required List<String> imageList,
  }) = Initial;

  factory ImagesState.initial(){
    return const ImagesState(imageList: []);
  }
  
}
