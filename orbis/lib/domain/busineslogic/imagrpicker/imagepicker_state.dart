import 'dart:io';

import 'package:equatable/equatable.dart';


abstract class ImageState extends Equatable {
   final File imageFile ;
   const ImageState(this.imageFile);
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {
  const ImageInitial(super.imageFile);
}

class ImageLoading extends ImageState {
  const ImageLoading(super.imageFile);
}

class ImageLoaded extends ImageState {
 
   const ImageLoaded(super.imageFile);
  @override
  List<Object> get props => [imageFile];
}

class ImageError extends ImageState {
  final String message;
   const ImageError(this.message,super.imageFile) ;
  @override
  List<Object> get props => [message];
}
