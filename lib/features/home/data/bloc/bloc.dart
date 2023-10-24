import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/utils/error_getter.dart';
import 'package:flutter_test_project/features/home/data/bloc/events.dart';
import 'package:flutter_test_project/features/home/data/bloc/states.dart';
import 'package:flutter_test_project/features/home/data/source/album_api.dart';
import 'package:flutter_test_project/features/home/data/source/photo_api.dart';
import 'package:flutter_test_project/features/home/data/source/user_api.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.remoteUsers, required this.remoteAlbums, required this.remotePhotos}) : super(UsersInitial()) {
    on<ReadUsers>(_readUsers);
  }
  final UsersApi remoteUsers;

  final AlbumsApi remoteAlbums;
  final PhotosApi remotePhotos;



  Future<void> _readUsers(
    ReadUsers event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoading());
      final responseUsers = await remoteUsers.getUsers();
      final responseAlbums = await remoteAlbums.getAlbums();
      final responsePhotos = await remotePhotos.getPhotos();
      emit(
        UsersLoaded(listUsers: responseUsers, listAlbums: responseAlbums, listPhotos: responsePhotos),
      );
    try {
      
    } catch (error) {
      emit(UsersError(errorToString(error)));
      rethrow;
    }
  }
}
