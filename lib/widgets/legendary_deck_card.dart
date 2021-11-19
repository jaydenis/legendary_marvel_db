import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';

import '../constants.dart';

class LegendaryDeckCard extends StatelessWidget {
  final legendaryDeck;
  final double width;

  const LegendaryDeckCard({
    Key? key,
    required this.legendaryDeck,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: width,

      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(IMAGE_ROOT+legendaryDeck['deckImage']),
                    fit: BoxFit.cover)
            ),
          ),
          Container(
            //decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                            legendaryDeck["deckName"] ?? "",
                          style: const TextStyle(
                              color: textWhite,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )),


                ],
              ),
            ),
          ),
          /*Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  legendaryDeck["deckName"] ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textBlack,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
          )*/
        ],
      ),
    );
  }
}

