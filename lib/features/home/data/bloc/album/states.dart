import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/features/home/data/dto/album_dto.dart';

class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsError extends AlbumsState with EquatableMixin {
  AlbumsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class AlbumsLoaded extends AlbumsState with EquatableMixin {
  AlbumsLoaded({required this.list});

  final List<AlbumsDto> list;

  @override
  List<Object?> get props => [list];
}
