import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legendary_marvel_db/data/legendary_data_object.dart';
import 'package:legendary_marvel_db/data/legendary_decks_json.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/legendary_deck_card.dart';
import 'package:legendary_marvel_db/widgets/main_app_bar.dart';

import '../constants.dart';
import 'legendary_deck_detail_page.dart';

class LegendarySetDetailPage extends StatefulWidget {
  final int setId;
  final String setName;
  final String boxImage;
  final int yearReleased;
  final int numberOfCards;
  const LegendarySetDetailPage({
    Key? key,
    required this.setId,
    required this.setName,
    required this.boxImage,
    required this.yearReleased,
    required this.numberOfCards
  }) : super(key: key);


  @override
  _LegendarySetDetailPageState createState() => _LegendarySetDetailPageState();
}

class _LegendarySetDetailPageState extends State<LegendarySetDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child:  getAppBar(),
        preferredSize: const Size.fromHeight(200)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }


  Widget getAppBar() {
    var size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow_back_icon.svg",
            color: textWhite,
          )),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(IMAGE_ROOT+widget.boxImage),
                    fit: BoxFit.cover)
            ),
          ),

          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          widget.setName,
                          style: const TextStyle(
                              color: textWhite,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_moderator_sharp, color: textWhite, size: 18),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Year: "+widget.yearReleased.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "# of Cards: "+ widget.numberOfCards.toString(),
                        style: const TextStyle(fontSize: 15, color: textWhite),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    var objects = legendaryDecks.where((element) =>
    element['setId'] == widget.setId).toList();
    var size = MediaQuery
        .of(context)
        .size;
    return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          children: List.generate(objects.length, (index) {
            return Center(
              child: Padding(
                padding:
                const EdgeInsets.only(bottom: bottomMainPadding),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LegendaryDeckDetailPage(
                                deckId: objects[index]['deckId'],
                                setId: objects[index]['setId'],
                                deckName: objects[index]['deckName'],
                                deckImage: objects[index]['deckImage'],
                                deckType: objects[index]['deckType'],
                              )
                      ),
                    );
                  },
                  child: LegendaryDeckCard(
                      width: size.width - (mainPadding * 2),
                      legendaryDeck: objects[index]),
                ),
              ),
            );
          }),
        );
  }

  Widget getFooter() {
    List iconItems = [
      "assets/icons/home_icon.svg",
      "assets/icons/search_icon.svg",
    ];
    List textItems = ["Home", "Search"];
    List navItems = ["/", "/search"];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)))),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconItems.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, navItems[index]);
                });
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    iconItems[index],
                    width: 22,
                    color: pageIndex == index ? primary : textBlack,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                        fontSize: 10,
                        color: pageIndex == index ? primary : textBlack),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

}
