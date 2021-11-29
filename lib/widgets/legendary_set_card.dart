import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_models.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';

import '../constants.dart';

class LegendarySetCard extends StatelessWidget {
  final LegendarySetDataModel legendarySetFuture;
  final double width;

  const LegendarySetCard({
    Key? key,
    required this.legendarySetFuture,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendarySetDataModel legendarySet = legendarySetFuture as LegendarySetDataModel;
    return Container(
      width: this.width,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: this.width,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  IMAGE_ROOT+legendarySet.boxImage,
                  fit: BoxFit.cover,
                ),
              )
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              legendarySet.setName,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                  color: textBlack,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
