import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FoodDetailsSlider extends StatelessWidget {
  final String slideImage1;
  final String slideImage2;
  final String slideImage3;

  FoodDetailsSlider(
      {Key? key,
      required this.slideImage1,
      required this.slideImage2,
      required this.slideImage3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: CarouselSlider(
                items: [
                  Image.asset(
                    slideImage1,
                  ),
                  /* Image.asset(
                    slideImage2,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Image.asset(
                    slideImage3,
                    height: double.infinity,
                    width: double.infinity,
                  ),*/
                ],
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: 2.0,
                ),
              )
    );
  }
}
