import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_sets_json.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import 'legendary_set_card.dart';

class LegendarySetsHorzAtom extends StatelessWidget {
  const LegendarySetsHorzAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class LegendarySetsNewAtom extends StatelessWidget {
  const LegendarySetsNewAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


class LegendarySetsAllAtom extends StatelessWidget {
  const LegendarySetsAllAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
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
                              builder: (context) =>
                                  LegendarySetDetailPage(
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
    );
  }
}