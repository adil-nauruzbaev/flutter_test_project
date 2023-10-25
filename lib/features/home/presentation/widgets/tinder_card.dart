import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_project/features/home/data/dto/album_dto.dart';
import 'package:flutter_test_project/features/home/data/dto/photos_dto.dart';
import 'package:flutter_test_project/features/home/data/dto/user_dto.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/text_widget.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({
    super.key,
    required this.id,
    required this.name,
    required this.company,
    required this.userData,
    required this.albumsUrl,
    required this.photosUrl,
  });
  final int id;
  final String name;
  final String company;

  final UsersDto userData;

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
        _openDialog(
          widget.name,
          widget.company,
          widget.photosUrl,
          widget.userData.email,
          widget.userData.phone,
          widget.userData.website,
          widget.userData.username,
          widget.userData.address.street,
          widget.userData.address.suite,
          widget.userData.address.city,
          widget.userData.address.zipcode,
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
                    TextWidget(
                      data: widget.name,
                      fontSize: 32,
                    ),
                    TextWidget(
                      data: widget.company,
                      fontSize: 16,
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

  void _openDialog(
    String name,
    String company,
    Iterable<PhotosDto> imageUrl,
    String email,
    String phone,
    String website,
    String username,
    String street,
    String suite,
    String city,
    String zipcode,
  ) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CarouselSlider.builder(
                        itemCount: imageUrl.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          print('$index Индекс фотографий');
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(imageUrl.elementAt(index).url),
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
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: double.infinity,
                          viewportFraction: 1,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        padding: const EdgeInsets.all(32),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextWidget(
                              data: name,
                              fontSize: 32,
                            ),
                            TextWidget(
                              data: username,
                              fontSize: 22,
                            ),
                            TextWidget(
                              data: company,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: email,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: phone,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: website,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: street,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: suite,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: city,
                              fontSize: 16,
                            ),
                            TextWidget(
                              data: zipcode,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
