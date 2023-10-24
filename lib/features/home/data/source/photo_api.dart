import 'dart:convert';

import 'package:flutter_test_project/core/constants.dart';
import 'package:flutter_test_project/features/home/data/dto/photos_dto.dart';
import 'package:http/http.dart' as http;

abstract class PhotosApi {
  Future<List<PhotosDto>> getPhotos();
}

class PhotosApiImpl extends PhotosApi {
  final http.Client client;

  PhotosApiImpl({required this.client});

  @override
  getPhotos() => getPhotosFromUrl(photosUrl);
  Future<List<PhotosDto>> getPhotosFromUrl(String photosUrl) async {
    try {
      final response = await http.get(
        Uri.parse(photosUrl),
      );

      final jsonPhotos = json.decode(response.body);
      List<PhotosDto> listPhotos = [];
      for (final item in jsonPhotos) {
        PhotosDto resposse = PhotosDto.fromJson(item);
        listPhotos.add(resposse);
      }

      return listPhotos;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
