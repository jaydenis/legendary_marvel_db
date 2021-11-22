import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/data/legendary_sets_json.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';
import 'legendary_set_card.dart';

class LegendarySetsTable extends StatelessWidget {
  const LegendarySetsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
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
                  child: LegendarySetCard(width: size.width - (mainPadding * 2), legendarySet: legendarySet),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

DataRow legendarySetDataRow(BuildContext context, int setId, String imagePath, String setName, int yearReleased, int numberOfCards) {
  return DataRow(
    cells: [
      DataCell(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LegendarySetDetailPage(
                    setId: setId,
                    setName: setName,
                    boxImage: imagePath,
                    yearReleased: yearReleased,
                    numberOfCards: numberOfCards,
                  )
              )
          );
        }, // handle your image tap here
        child: Image.network(
          IMAGE_ROOT+imagePath,
          fit: BoxFit.cover, // this is the solution for border
          width: 110.0,
        ),
      )
      ),
      DataCell(Text(setName)),
      DataCell(Text(yearReleased.toString())),
    ],
  );
}
