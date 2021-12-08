


import 'package:flutter/cupertino.dart';
import 'package:legendary_marvel_db/data/legendary_deck_types_json.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';

class HomePageCover extends StatelessWidget {
  const HomePageCover({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getHeight(size.width, "21:9"),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/images/marvel_legendary_deck_building_game.jpg"), fit: BoxFit.cover)),
        ),
       // deckTypeMenu(context),

      ],
    );
  }

  @override
  Widget deckTypeMenu(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
        const EdgeInsets.only(top: mainPadding, bottom: mainPadding),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(legendaryDeckTypes.length, (index) {
              return SizedBox(
                width: 80,
                height: 58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(APP_ROOT+legendaryDeckTypes[index]['deckTypeImage'],
                      height: 36,
                      width: 36,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(legendaryDeckTypes[index]['deckType'])
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );

  }
}