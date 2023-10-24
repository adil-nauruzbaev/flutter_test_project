import 'dart:convert';

import 'package:flutter_test_project/core/constants.dart';
import 'package:flutter_test_project/features/home/data/dto/album_dto.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsApi {
  Future<List<AlbumsDto>> getAlbums();
}

class AlbumsApiImpl extends AlbumsApi {
  final http.Client client;

  AlbumsApiImpl({required this.client});

  @override
  getAlbums() => getAlbumsFromUrl(albumUrl);
  Future<List<AlbumsDto>> getAlbumsFromUrl(String albumUrl) async {
    try {
      final response = await http.get(
        Uri.parse(albumUrl),
      );

      final jsonAlbums = json.decode(response.body);
      List<AlbumsDto> listAlbums = [];
      for (final item in jsonAlbums) {
        AlbumsDto resposse = AlbumsDto.fromJson(item);
        listAlbums.add(resposse);
      }

      return listAlbums;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
