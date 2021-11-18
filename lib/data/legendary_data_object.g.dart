// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legendary_data_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegendarySetObject _$LegendarySetObjectFromJson(Map<String, dynamic> json) {
  return LegendarySetObject(
    setId: json['setId'] as int?,
    setName: json['setName'] as String?,
    setSize: json['setSize'] as String?,
    numberOfCards: json['numberOfCards'] as int?,
    yearReleased: json['yearReleased'] as int?,
    boxImage: json['boxImage'] as String?,
  );
}

Map<String, dynamic> _$LegendarySetObjectToJson(LegendarySetObject instance) =>
    <String, dynamic>{
      'setId': instance.setId,
      'setName': instance.setName,
      'setSize': instance.setSize,
      'numberOfCards': instance.numberOfCards,
      'yearReleased': instance.yearReleased,
      'boxImage': instance.boxImage,
    };

LegendaryDeckObject _$LegendaryDeckObjectFromJson(Map<String, dynamic> json) {
  return LegendaryDeckObject(
    deckId: json['deckId'] as int?,
    setId: json['setId'] as int?,
    deckImage: json['deckImage'] as String?,
    deckName: json['deckName'] as String?,
    deckType: json['deckType'] as String?,
  );
}

Map<String, dynamic> _$LegendaryDeckObjectToJson(
        LegendaryDeckObject instance) =>
    <String, dynamic>{
      'deckId': instance.deckId,
      'setId': instance.setId,
      'deckImage': instance.deckImage,
      'deckName': instance.deckName,
      'deckType': instance.deckType,
    };

LegendaryCardObject _$LegendaryCardObjectFromJson(Map<String, dynamic> json) {
  return LegendaryCardObject(
    cardId: json['cardId'] as int?,
    deckId: json['deckId'] as int?,
    setId: json['setId'] as int?,
    cardName: json['cardName'] as String?,
    cardImage: json['cardImage'] as String?,
    cardType: json['cardType'] as String?,
    teamName: json['teamName'] as String?,
    yearReleased: json['yearReleased'] as int?,
    numberInDeck: json['numberInDeck'] as int?,
  );
}

Map<String, dynamic> _$LegendaryCardObjectToJson(
        LegendaryCardObject instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'deckId': instance.deckId,
      'setId': instance.setId,
      'cardName': instance.cardName,
      'cardImage': instance.cardImage,
      'cardType': instance.cardType,
      'teamName': instance.teamName,
      'yearReleased': instance.yearReleased,
      'numberInDeck': instance.numberInDeck,
    };
