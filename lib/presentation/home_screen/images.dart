import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zaigo_test/application/images/images_bloc.dart';

final Directory _photoDir = Directory('/storage/emulated/0/Pictures');

class ImageCapture extends StatelessWidget {
  ImageCapture({super.key});

  Uint8List? image1;

  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<ImagesBloc>(context).add(const FetchImages());
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await takeImage().then((value) {
            Future.delayed(const Duration(milliseconds: 500)).then((value) =>
                BlocProvider.of<ImagesBloc>(context).add(const FetchImages()));
          });
        },
        child: const Icon(Icons.camera_alt,size: 30,),
      ),
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: ImageGrid(),
    );
  }

  Future takeImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final temp = await image.readAsBytes();

    image1 = temp;

    GallerySaver.saveImage(image.path);
  }
}

class ImageGrid extends StatelessWidget {
  ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) {
        if (state.imageList == []) {
          return const Center(
            child: Text(
              'No images found',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        return GridView.builder(
          itemCount: state.imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 3.0 / 4.6),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.file(
                    File(state.imageList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
