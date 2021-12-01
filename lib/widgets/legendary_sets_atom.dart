import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';
import '../responsive.dart';
import 'legendary_set_card.dart';
import 'package:http/http.dart' as http;

class LegendarySetsHorzAtom extends StatelessWidget {
  Future<List<LegendarySetDetails>?> ReadJsonData() async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).where((element) => element.yearReleased >= 2019).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
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
          var items = data.data as List<LegendarySetDetails>;
          return Column(
            children: [
              SizedBox(height: defaultPadding),
              Responsive(
                mobile: SetInfoCardGridView(legendarySets: items,
                  crossAxisCount: size.width < 650 ? 2 : 4,
                  childAspectRatio: size.width < 650 ? 1.3 : 1,
                ),
                tablet: SetInfoCardGridView(legendarySets: items),
                desktop: SetInfoCardGridView(legendarySets: items,
                  childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                ),
              ),
              ]
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

class SetInfoCardGridView extends StatelessWidget {
  const SetInfoCardGridView({
    Key? key,
    required this.legendarySets,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);
final List<LegendarySetDetails> legendarySets;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: legendarySets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => LegendarySetCardSmall(legendarySetFuture: legendarySets[index]),
    );
  }
}

class LegendarySetsVertAtom extends StatelessWidget {
  Future<List<LegendarySetDetails>> ReadJsonData() async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  LegendarySetsVertAtom({Key? key}) : super(key: key);

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
            var items = data.data as List<LegendarySetDetails>;

            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: secondaryColor),
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

class LegendarySetsNewAtom extends StatelessWidget {
  Future<List<LegendarySetDetails>?> ReadJsonData() async {
    final response = await http
        .get(Uri.parse('https://raw.githubusercontent.com/jaydenis/legendary_marvel_cards/master/json_data/legendary_sets.json'));

    if (response.statusCode == 200) {
      final list = json.decode(response.body) as List<dynamic>;
      return list.map((e) => LegendarySetDetails.fromJson(e)).where((element) => element.yearReleased >= 2019).toList();
    } else {
      throw Exception('Failed to load Legendary Set');
    }
  }

  LegendarySetsNewAtom({Key? key}) : super(key: key);

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
          var items = data.data as List<LegendarySetDetails>;

          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: secondaryColor),
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
