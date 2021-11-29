// To parse this JSON data, do
//
//     final legendarySet = legendarySetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class LegendarySetDataModel{
  //data Type
  late final int setId;
  late final String setName;
  late final String boxImage;
  late final int yearReleased;
  late final int numberOfCards;
// constructor
  LegendarySetDataModel(
      {
        required this.setId,
        required this.setName,
        required this.boxImage,
        required this.yearReleased,
        required this.numberOfCards,
      }
      );
  //method that assign values to respective datatype vairables
  LegendarySetDataModel.fromJson(Map<String,dynamic> json)
  {
    setId = json['setId'];
    setName =json['setName'];
    boxImage = json['boxImage'];
    yearReleased = json['yearReleased'];
    numberOfCards = json['numberOfCards'];
  }
}

