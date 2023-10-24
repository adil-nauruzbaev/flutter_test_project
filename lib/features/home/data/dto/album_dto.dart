import 'dart:convert';

List<AlbumsDto> albumsDtoFromJson(String str) => List<AlbumsDto>.from(json.decode(str).map((x) => AlbumsDto.fromJson(x)));

String albumsDtoToJson(List<AlbumsDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsDto {
    final int userId;
    final int id;
    final String title;

    AlbumsDto({
        required this.userId,
        required this.id,
        required this.title,
    });

    factory AlbumsDto.fromJson(Map<String, dynamic> json) => AlbumsDto(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
