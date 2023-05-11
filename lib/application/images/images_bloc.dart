import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zaigo_test/presentation/home_screen/images.dart';

part 'images_event.dart';
part 'images_state.dart';
part 'images_bloc.freezed.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesState.initial()) {
    on<FetchImages>((event, emit) {
      final Directory _photoDir = Directory('/storage/emulated/0/Pictures');
      var imageList = _photoDir
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".jpg"))
          .toList(growable: false);
      emit(state.copyWith(imageList: imageList));
    });
  }
}
