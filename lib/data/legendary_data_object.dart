import 'package:json_annotation/json_annotation.dart';

part 'legendary_data_object.g.dart';

@JsonSerializable()
class LegendarySetObject {
  LegendarySetObject({
    this.setId,
    this.setName,
    this.setSize,
    this.numberOfCards,
    this.yearReleased,
    this.boxImage,
  });

  final int? setId;
  final String? setName;
  final String? setSize;
  final int? numberOfCards;
  final int? yearReleased;
  final String? boxImage;

  factory LegendarySetObject.fromJson(Map<String, dynamic> json) =>
      _$LegendarySetObjectFromJson(json);

  Map<String, dynamic> toJson() => _$LegendarySetObjectToJson(this);
}

@JsonSerializable()
class LegendaryDeckObject {
  LegendaryDeckObject({
    this.deckId,
    this.setId,
    this.deckImage,
    this.deckName,
    this.deckType,
  });

  final int? deckId;
  final int? setId;
  final String? deckImage;
  final String? deckName;
  final String? deckType;

  factory LegendaryDeckObject.fromJson(Map<String, dynamic> json) =>
      _$LegendaryDeckObjectFromJson(json);

  Map<String, dynamic> toJson() => _$LegendaryDeckObjectToJson(this);
}


@JsonSerializable()
class LegendaryCardObject {
  LegendaryCardObject({
    this.cardId,
    this.deckId,
    this.setId,
    this.cardName,
    this.cardImage,
    this.cardType,
    this.teamName,
    this.yearReleased,
    this.numberInDeck
  });

  final int? cardId;
  final int? deckId;
  final int? setId;
  final String? cardName;
  final String? cardImage;
  final String? cardType;
  final String? teamName;
  final int? yearReleased;
  final int? numberInDeck;

  factory LegendaryCardObject.fromJson(Map<String, dynamic> json) =>
      _$LegendaryCardObjectFromJson(json);

}
