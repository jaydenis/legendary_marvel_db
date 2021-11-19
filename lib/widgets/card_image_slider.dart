import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_cards_json.dart';
import 'package:legendary_marvel_db/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImageSlider extends StatefulWidget {
  final int deckId;
  const CardImageSlider({Key? key, required this.deckId}) : super(key: key);

  @override
  _CardImageSliderState createState() => _CardImageSliderState();
}

class _CardImageSliderState extends State<CardImageSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var objects = legendaryCards.where((element) =>
    element['deckId'] == widget.deckId).toList();
    List<Widget> imageListWidgets = [];
    for (var image in objects) {
      imageListWidgets.add(
          _toCarouselSliderWidget(IMAGE_ROOT + image['cardImage']));
    }
    return ListView(
      children: [
        CarouselSlider(
          items: imageListWidgets,
          carouselController: buttonCarouselController,
          //Slider Container properties
          options: CarouselOptions(
            height: 525.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 137 / 187,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.arrow_back_outlined),
                color: Colors.blue[400],
                onPressed: () => buttonCarouselController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.arrow_forward_outlined),
                  color: Colors.blue[400],
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear),
              ),
            ),

          ],
        ),
      ],
    );
  }


  Widget _toCarouselSliderWidget(String imagePath) {
    return
      CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl:imagePath,
      );
    /* Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image:  DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );*/
  }


}
