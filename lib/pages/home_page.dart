import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_deck_types_json.dart';
import 'package:legendary_marvel_db/data/legendary_sets_json.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';
import 'package:legendary_marvel_db/widgets/main_app_bar.dart';
import 'package:legendary_marvel_db/widgets/legendary_set_card.dart';

import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: const Size.fromHeight(40)),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: getHeight(size.width, "21:9"),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/images/marvel_legendary_deck_building_game.jpg"), fit: BoxFit.cover)),
          ),

          SizedBox(
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
                      height: 57,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(legendaryDeckTypes[index]['deckTypeImage'],
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
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Legendary Sets",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(legendarySets.length, (index) {
                        var legendarySet = legendarySets[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LegendarySetDetailPage(
                                          setId: legendarySet['setId'],
                                          setName: legendarySet['setName'],
                                          boxImage: legendarySet['boxImage'],
                                          yearReleased: legendarySet['yearReleased'],
                                          numberOfCards: legendarySet['numberOfCards'],
                                        )
                                    )
                                );
                              },
                              child: LegendarySetCard(width: 280, legendarySet: legendarySet),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                          const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LegendarySetDetailPage(
                                        setId: legendarySet['setId'],
                                        setName: legendarySet['setName'],
                                        boxImage: legendarySet['boxImage'],
                                        yearReleased: legendarySet['yearReleased'],
                                        numberOfCards: legendarySet['numberOfCards'],
                                      )
                                  )
                              );
                            },
                            child: LegendarySetCard(width: 280, legendarySet: legendarySet),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "New Sets",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                      List.generate(recommendedSets.length, (index) {
                        var legendarySet = recommendedSets[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LegendarySetDetailPage(
                                          setId: legendarySet['setId'],
                                          setName: legendarySet['setName'],
                                          boxImage: legendarySet['boxImage'],
                                          yearReleased: legendarySet['yearReleased'],
                                          numberOfCards: legendarySet['numberOfCards'],
                                        )
                                    )
                                );
                              },
                              child: LegendarySetCard(width: 180, legendarySet: legendarySet),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                          const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LegendarySetDetailPage(
                                        setId: legendarySet['setId'],
                                        setName: legendarySet['setName'],
                                        boxImage: legendarySet['boxImage'],
                                        yearReleased: legendarySet['yearReleased'],
                                        numberOfCards: legendarySet['numberOfCards'],
                                      )
                                  )
                              );
                            },
                            child: LegendarySetCard(width: 180, legendarySet: legendarySet),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(legendarySets.length, (index) {
                      return Padding(
                        padding:
                        const EdgeInsets.only(bottom: bottomMainPadding),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LegendarySetDetailPage(
                                      setId: legendarySets[index]['setId'],
                                      setName: legendarySets[index]['setName'],
                                      boxImage: legendarySets[index]['boxImage'],
                                      yearReleased: legendarySets[index]['yearReleased'],
                                      numberOfCards: legendarySets[index]['numberOfCards'],
                                    )));
                          },
                          child: LegendarySetCard(
                              width: size.width - (mainPadding * 2),
                              legendarySet: legendarySets[index]),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

