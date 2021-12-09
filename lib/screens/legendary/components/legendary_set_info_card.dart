
import 'package:cached_network_image/cached_network_image.dart';
import 'package:admin/models/legendary_set_model.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../legendary_set_details_screen.dart';

class LegendarySetInfoCard extends StatelessWidget {
  const LegendarySetInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final LegendarySetDetails info;

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
        const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LegendarySetDetailsScreen(
                            legendarySet: info,
                          )
                  )
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child:
              CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl:APP_ROOT + info.boxImage,
                fit: BoxFit.scaleDown,
              ),
            )
        ),
      ),
    );
  }
}

