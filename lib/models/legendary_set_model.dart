// To parse this JSON data, do
//
//     final legendarySetModel = legendarySetModelFromJson(jsonString);

import 'dart:convert';

List<LegendarySetModel> legendarySetModelFromJson(String str) => List<LegendarySetModel>.from(json.decode(str).map((x) => LegendarySetModel.fromJson(x)));

String legendarySetModelToJson(List<LegendarySetModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class LegendarySetDetails {
  LegendarySetDetails({
    required this.setId,
    required this.setName,
    required this.boxImage,
    required this.yearReleased,
    required this.numberOfCards,
    required this.jsonFile,
  });

  int setId;
  String setName;
  String boxImage;
  int yearReleased;
  int numberOfCards;
  String jsonFile;

  factory LegendarySetDetails.fromJson(Map<String, dynamic> json) => LegendarySetDetails(
    setId: json["setId"],
    setName: json["setName"],
    boxImage: json["boxImage"],
    yearReleased: json["yearReleased"],
    numberOfCards: json["numberOfCards"],
    jsonFile: json["jsonFile"],
  );

  Map<String, dynamic> toJson() => {
    "setId": setId,
    "setName": setName,
    "boxImage": boxImage,
    "yearReleased": yearReleased,
    "numberOfCards": numberOfCards,
    "jsonFile": jsonFile
  };
}

class LegendarySetModel {
  LegendarySetModel({
    required this.setId,
    required this.decks,
  });

  int setId;
  List<Deck> decks;

  factory LegendarySetModel.fromJson(Map<String, dynamic> json) => LegendarySetModel(
    setId: json["setId"],
    decks: List<Deck>.from(json["decks"].map((x) => Deck.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "setId": setId,
    "decks": List<dynamic>.from(decks.map((x) => x.toJson())),
  };
}


class Deck {
  Deck({
    required this.deckId,
    required this.setId,
    required this.deckImage,
    required this.deckName,
    required this.deckType,
    required this.cards,
  });

  int deckId;
  int setId;
  String deckImage;
  String deckName;
  String deckType;
  List<LegendaryCard> cards;

  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
    deckId: json["deckId"],
    setId: json["setId"],
    deckImage: json["deckImage"],
    deckName: json["deckName"],
    deckType: json["deckType"],
    cards: List<LegendaryCard>.from(json["cards"].map((x) => LegendaryCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "deckId": deckId,
    "setId": setId,
    "deckImage": deckImage,
    "deckName": deckName,
    "deckType": deckType,
    "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
  };
}

class LegendaryCard {
  LegendaryCard({
    required this.deckId,
    required this.setId,
    required this.cardImage,
    required this.cardType,
    required this.teamName,
    required this.cardName,
  });

  int deckId;
  int setId;
  String cardImage;
  String cardType;
  String teamName;
  String cardName;

  factory LegendaryCard.fromJson(Map<String, dynamic> json) => LegendaryCard(
    deckId: json["deckId"],
    setId: json["setId"],
    cardImage: json["cardImage"],
    cardType: json["cardType"],
    teamName: json["teamName"],
    cardName: json["cardName"] == null ? null : json["cardName"],
  );

  Map<String, dynamic> toJson() => {
    "deckId": deckId,
    "setId": setId,
    "cardImage": cardImage,
    "cardType": cardType,
    "teamName": teamName,
    "cardName": cardName == null ? null : cardName,
  };
}
