
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import 'legendary_details_info_card.dart';

class LegendaryDetails extends StatelessWidget {
  const LegendaryDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Legendary Marvel Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
         // Chart(),
          LegendaryDetailsInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Heroes",
            amountOfFiles: "750",
            numOfFiles: 1328,
          ),
          LegendaryDetailsInfoCard(
            svgSrc: "assets/icons/pdf_file.svg",
            title: "Masterminds",
            amountOfFiles: "75",
            numOfFiles: 1328,
          ),
          LegendaryDetailsInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Villains",
            amountOfFiles: "250",
            numOfFiles: 1328,
          ),
          LegendaryDetailsInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Henchmen",
            amountOfFiles: "140",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
