import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:legendary_marvel_db/models/legendary_set_model.dart';
import 'package:legendary_marvel_db/pages/legendary_set_detail_page.dart';
import 'package:legendary_marvel_db/theme/colors.dart';
import 'package:legendary_marvel_db/theme/fontsizes.dart';
import 'package:legendary_marvel_db/theme/helper.dart';
import 'package:legendary_marvel_db/theme/padding.dart';

import '../constants.dart';

class LegendarySetCard extends StatelessWidget {
  final LegendarySetDetails legendarySetFuture;
  final double width;

  const LegendarySetCard({
    Key? key,
    required this.legendarySetFuture,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendarySetDetails legendarySet = legendarySetFuture as LegendarySetDetails;
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
          SizedBox(
              width: width,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageUrl:IMAGE_ROOT + legendarySetFuture.boxImage,
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


class LegendarySetCardSmall extends StatelessWidget {
  const LegendarySetCardSmall({
    Key? key,
    required this.legendarySetFuture,
  }) : super(key: key);

  final LegendarySetDetails legendarySetFuture;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(bottom: bottomMainPadding),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LegendarySetDetailPage(
                            legendarySet: legendarySetFuture,
                          )
                  )
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child:
              CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl:IMAGE_ROOT + legendarySetFuture.boxImage,
                fit: BoxFit.cover,
              ),
            )
        ),
      ),
    );
  }
}
