import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../models/carousel.dart';
import 'theme.widget.dart';

class CarouselWidget {
  Widget slider(List<Carousel> carousels) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: CarouselSlider.builder(
          itemCount: carousels.length,
          itemBuilder: (context, index, page) {
            if (carousels.isNotEmpty) {
              return _verticalCard(context, carousels[index]);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          options: CarouselOptions(
            height: 130,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      );

  Widget _verticalCard(context, carousel) => AspectRatio(
        aspectRatio: 15 / 2,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
              Radius.circular(7)
          ),
          child: ThemeWidget().networkImage("${imageUrl}carousels/" + carousel.image),
        ),
      );
}
