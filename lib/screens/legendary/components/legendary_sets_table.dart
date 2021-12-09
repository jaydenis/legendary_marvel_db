
import 'package:admin/models/legendary_set_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../legendary_set_details_screen.dart';

class LegendarySetsTable extends StatelessWidget {
  final Future<List<LegendarySetDetails>> legendarySets;
  const LegendarySetsTable({
    Key? key, required this.legendarySets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: legendarySets,
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<LegendarySetDetails>;

          return Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Legendary Sets",
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    minWidth: 350,
                    columns: [
                      DataColumn(
                        label: Text(""),
                      ),
                      DataColumn(
                        label: Text("Set Name"),
                      ),
                      DataColumn(
                        label: Text("Year"),
                      ),
                      DataColumn(
                        label: Text("Cards"),
                      ),
                    ],
                    rows: List.generate(
                      items.length,
                          (index) => recentFileDataRow(context,items[index]),
                    ),
                  ),
                ),
              ],
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


  DataRow recentFileDataRow(BuildContext context, LegendarySetDetails legendarySet) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            GestureDetector(
                onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LegendarySetDetailsScreen(
                            legendarySet: legendarySet,
                          )
                  )
              );
            },
              child:  Image.network(
                        APP_ROOT+legendarySet.boxImage,
                        height: 100,
                        width: 100,
                      ),
            ),
          ],
        ),
      ),
      DataCell(Text(legendarySet.setName,
          overflow: TextOverflow.ellipsis)),
      DataCell(Text(legendarySet.yearReleased.toString())),
      DataCell(Text(legendarySet.numberOfCards.toString())),
    ],
  );
}