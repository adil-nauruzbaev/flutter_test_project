import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test_project/core_d_i.dart';

import 'package:flutter_test_project/features/home/data/bloc/user/bloc.dart';
import 'package:flutter_test_project/features/home/data/bloc/user/events.dart';

import 'package:flutter_test_project/features/home/data/bloc/user/states.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/tinder_builder.dart';
import 'package:flutter_test_project/features/home/presentation/widgets/tinder_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    CoreDi.get<UsersBloc>().add(ReadUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinderBuilder(
        builder: (UsersLoaded data) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: double.infinity,
                        viewportFraction: 1,
                      ),
                      carouselController: buttonCarouselController,
                      itemCount: data.listUsers.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        print(index);
                        return TinderCard(
                          id: data.listUsers[index].id,
                          name: data.listUsers[index].name,
                          company: data.listUsers[index].company.name,
                          albumsUrl: data.listAlbums.where(
                            (element) => index + 1 == (element.userId),
                          ),
                          photosUrl: data.listPhotos.where((element) =>
                              data.listAlbums.where(
                                  (element) => index + 1 == (element.id)).first.id == (element.albumId)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          buttonCarouselController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          buttonCarouselController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
