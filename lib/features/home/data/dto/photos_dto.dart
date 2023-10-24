import 'dart:convert';

List<PhotosDto> photosDtoFromJson(String str) => List<PhotosDto>.from(json.decode(str).map((x) => PhotosDto.fromJson(x)));

String photosDtoToJson(List<PhotosDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosDto {
    final int albumId;
    final int id;
    final String title;
    final String url;
    final String thumbnailUrl;

    PhotosDto({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory PhotosDto.fromJson(Map<String, dynamic> json) => PhotosDto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
