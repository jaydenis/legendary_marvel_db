import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';

class LegendaryDeckCard extends StatelessWidget {
  final legendaryDeck;
  final double width;

  const LegendaryDeckCard({
    Key? key,
    required this.legendaryDeck,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image:  DecorationImage(
          image: NetworkImage(legendaryDeck["deckImage"]),
          fit: BoxFit.cover,
        ),
      ),
    ),

          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  legendaryDeck["setName"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textBlack,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  legendaryDeck["deckName"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: grey,
                    fontSize: subTitleFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getSvgIcon("clock_icon.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      legendaryDeck["deckType"].toString(),
                      style: const TextStyle(
                          color: primary,
                          fontSize: hintTextFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
