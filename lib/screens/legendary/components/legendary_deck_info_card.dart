

import 'package:admin/models/legendary_set_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../legendary_deck_details_screen.dart';

class LegendaryDeckInfoCard extends StatelessWidget {
  const LegendaryDeckInfoCard({
    Key? key,
    required this.legendaryDeck,
  }) : super(key: key);

  final Deck legendaryDeck;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(defaultPadding),
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
                        LegendaryDeckDetailsScreen(legendaryDeck: legendaryDeck,
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