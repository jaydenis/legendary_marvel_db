import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';
import '../responsive.dart';
import 'legendary_set_card.dart';

class LegendarySetsHorzAtom extends StatelessWidget {
  final Future<List<LegendarySetDetails>> list;

  const LegendarySetsHorzAtom({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        FutureBuilder(
          future: list,
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<LegendarySetDetails>;

              return Column(
                children: [
                  const SizedBox(height: defaultPadding),
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
        ),
      ],
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
  final Future<List<LegendarySetDetails>> list;

  const LegendarySetsVertAtom({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
        future: list,
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
  final Future<List<LegendarySetDetails>> list;

  const LegendarySetsNewAtom({Key? key, required this.list}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder(
      future: list,
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetDetails>;
          var newItems = items.where((element) => element.yearReleased < 2020).toList();
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
                    children: List.generate(newItems.length, (index) {
                      var legendarySet = newItems[index];
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

