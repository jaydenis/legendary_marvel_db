import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_deck_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';

import '../constants.dart';

class LegendaryDeckCard extends StatelessWidget {
  final Deck legendaryDeck;
  final double width;

  const LegendaryDeckCard({
    Key? key,
    required this.legendaryDeck,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: width,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  APP_ROOT+legendaryDeck.deckImage,
                  fit: BoxFit.cover,
                ),
              )
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              legendaryDeck.deckName,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                  color: textBlack,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class LegendaryDeckCardSmall extends StatelessWidget {
  const LegendaryDeckCardSmall({
    Key? key,
    required this.legendaryDeck,
  }) : super(key: key);

  final Deck legendaryDeck;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LegendaryDeckDetailPage(legendaryDeck: legendaryDeck,
                        )
                )
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl:APP_ROOT + legendaryDeck.deckImage,
              fit: BoxFit.cover,
            ),
          )
        ),
    );
  }
}

