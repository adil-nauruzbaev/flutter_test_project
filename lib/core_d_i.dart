import 'package:flutter_test_project/features/home/data/bloc/bloc.dart';
import 'package:flutter_test_project/features/home/data/source/album_api.dart';
import 'package:flutter_test_project/features/home/data/source/photo_api.dart';
import 'package:flutter_test_project/features/home/data/source/user_api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class CoreDi {
  static GetIt get = GetIt.asNewInstance();
  GetIt injection = GetIt.instance;
  static void register() {
    get.registerLazySingleton<UsersBloc>(
      () => UsersBloc(
        remoteUsers: UsersApiImpl(
          client: http.Client(),
        ),
        remoteAlbums: AlbumsApiImpl(
          client: http.Client(),
        ),
        remotePhotos: PhotosApiImpl(
          client: http.Client(),
        ),
      ),
    );
  }
}
