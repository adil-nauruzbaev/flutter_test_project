import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/data/dto/photos_dto.dart';

class PhotosState {}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosError extends PhotosState with EquatableMixin {
  PhotosError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class PhotosLoaded extends PhotosState with EquatableMixin {
  PhotosLoaded({required this.list});

  final List<PhotosDto> list;

  @override
  List<Object?> get props => [list];
}
