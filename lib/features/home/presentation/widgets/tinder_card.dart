import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/card/presentation/card_screen.dart';
import 'package:flutter_test_project/features/home/data/dto/album_dto.dart';
import 'package:flutter_test_project/features/home/data/dto/photos_dto.dart';

class TinderCard extends StatefulWidget {
  TinderCard({
    super.key,
    required this.id,
    required this.name,
    required this.company,
    required this.albumsUrl,
    required this.photosUrl,
  });
  final int id;
  final String name;
  final String company;

  final Iterable<AlbumsDto> albumsUrl;
  final Iterable<PhotosDto> photosUrl;

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.albumsUrl.elementAt(0).title);
        print(widget.photosUrl.elementAt(0).title);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CardScreen(name: widget.name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.photosUrl.first.url),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1],
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Flexible(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.company,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
