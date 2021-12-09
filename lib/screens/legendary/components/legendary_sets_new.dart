

import 'dart:convert';

import 'package:admin/models/legendary_set_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'legendary_set_info_card.dart';
import 'package:http/http.dart' as http;

class NewLegendarySets extends StatelessWidget {

  final Future<List<LegendarySetDetails>> legendarySets;
  const NewLegendarySets({
    Key? key, required this.legendarySets,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return
      FutureBuilder(
        future: legendarySets,
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<LegendarySetDetails>;
            var itemsList = items.where((element) => element.yearReleased >= 2013).toList();
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Legendary Sets",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    ElevatedButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical:
                          defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Add New"),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                Responsive(
                  mobile: LegendarySetInfoCardGridView(
                    crossAxisCount: _size.width < 650 ? 2 : 4,
                    childAspectRatio: _size.width < 650 ? 1.3 : 1,
                    legendarySets: itemsList,
                  ),
                  tablet: LegendarySetInfoCardGridView(legendarySets: itemsList),
                  desktop: LegendarySetInfoCardGridView(
                      childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,legendarySets: itemsList
                  ),
                ),
              ],
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

class LegendarySetInfoCardGridView extends StatelessWidget {
  const LegendarySetInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1, required this.legendarySets,
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
      itemBuilder: (context, index) => LegendarySetInfoCard(info: legendarySets[index]),
    );
  }
}
