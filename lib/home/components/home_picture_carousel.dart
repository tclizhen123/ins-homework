import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

typedef HomePictureCarouselCallback = void Function(int index);

class HomePictureCarousel extends StatelessWidget {
  final List<String?>? urls;
  final HomePictureCarouselCallback? callback;
  const HomePictureCarousel(
      {super.key, required this.urls, required this.callback});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (urls ?? [])
          .map(
            (p) => Image.network(
              p ?? "",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 500,
        initialPage: 0,
        onPageChanged: (index, reason) {
          if (callback != null) {
            callback!(index);
          }
        },
      ),
    );
  }
}
