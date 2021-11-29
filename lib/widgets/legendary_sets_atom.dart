import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import 'legendary_set_card.dart';

class LegendarySetsHorzAtom extends StatelessWidget {

  Future<List<LegendarySetDataModel>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('assets/data/legendary_sets.json');

    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => LegendarySetDataModel.fromJson(e)).toList();
  }

  LegendarySetsHorzAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<LegendarySetDataModel>;

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
                      children: List.generate(items.length, (index) {
                        var legendarySet = items[index];
                        return Padding(
                          padding:
                          const EdgeInsets.only(bottom: bottomMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LegendarySetDetailPage(legendarySet: legendarySet,
                                          )
                                  )
                              );
                            },
                            child: LegendarySetCard(
                                width: size.width - (mainPadding * 2),
                                legendarySetFuture: legendarySet),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );

          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}
/*

class LegendarySetsNewAtom extends StatelessWidget {
  final Future<List<LegendarySetDataModel>>  recommendedSets;
  const LegendarySetsNewAtom({Key? key, required this.recommendedSets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var legendarySets = recommendedSets as List<LegendarySetDataModel>;
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
                List.generate(legendarySets.length, (index) {
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
                                    setId: legendarySet.setId,
                                    setName: legendarySet.setName,
                                    boxImage: legendarySet.boxImage,
                                    yearReleased: legendarySet.yearReleased,
                                    numberOfCards: legendarySet.numberOfCards,
                                  )
                              )
                          );
                        },
                        child: LegendarySetCard(width: 180, legendarySetFuture: legendarySet),
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
                                  setId: legendarySet.setId,
                                  setName: legendarySet.setName,
                                  boxImage: legendarySet.boxImage,
                                  yearReleased: legendarySet.yearReleased,
                                  numberOfCards: legendarySet.numberOfCards,
                                )
                            )
                        );
                      },
                      child: LegendarySetCard(width: 180, legendarySetFuture: legendarySet),
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
  final Future<List<LegendarySetDataModel>> legendarySetsList;
  const LegendarySetsAllAtom({Key? key, required this.legendarySetsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var legendarySets = legendarySetsList as List<LegendarySetDataModel>;
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
                var legendarySet = legendarySets[index];
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
                                    setId: legendarySet.setId,
                                    setName: legendarySet.setName,
                                    boxImage: legendarySet.boxImage,
                                    yearReleased: legendarySet.yearReleased,
                                    numberOfCards: legendarySet.numberOfCards,
                                  )));
                    },
                    child: LegendarySetCard(
                        width: size.width - (mainPadding * 2),
                        legendarySetFuture: legendarySets[index]),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}*/
