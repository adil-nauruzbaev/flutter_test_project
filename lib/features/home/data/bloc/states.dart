import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/data/dto/album_dto.dart';
import 'package:flutter_test_project/features/home/data/dto/photos_dto.dart';
import 'package:flutter_test_project/features/home/data/dto/user_dto.dart';

class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersError extends UsersState with EquatableMixin {
  UsersError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class UsersLoaded extends UsersState with EquatableMixin {
  UsersLoaded({required this.listUsers, required this.listAlbums, required this.listPhotos});

  final List<UsersDto> listUsers;
  final List<AlbumsDto> listAlbums;
  final List<PhotosDto> listPhotos;



  @override
  List<Object?> get props => [listUsers, listAlbums, listPhotos];
}
