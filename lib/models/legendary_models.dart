

class LegendarySet {
  final int setId;
  final String setName;
  final int? yearReleased;
  final int? numberOfCards;
  final String? boxImage;

  LegendarySet({
    required this.setId,
    required this.setName,
    required this.yearReleased,
    required this.numberOfCards,
    required this.boxImage
  });

  factory LegendarySet.fromJson(Map<String, dynamic> json) {
    return LegendarySet(
        setId: json['setId'],
        setName: json['setName'],
        yearReleased: json['yearReleased'],
        numberOfCards: json['numberOfCards'],
        boxImage: json['boxImage']
    );
  }
}

class LegendaryDeck {
  final int deckId;
  final int setId;
  final String deckName;
  final String deckType;
  final String deckImage;

  LegendaryDeck({
    required this.deckId,
    required this.setId,
    required this.deckName,
    required this.deckType,
    required this.deckImage
  });

  factory LegendaryDeck.fromJson(Map<String, dynamic> json) {
    return LegendaryDeck(
        deckId: json['deckId'],
        setId: json['setId'],
        deckName: json['deckName'],
        deckType: json['deckType'],
        deckImage: json['deckImage']
    );
  }
}

class LegendaryCard {
  final int deckId;
  final int setId;
  final String cardImage;
  final String cardName;
  final String team;

  LegendaryCard( {
    required this.deckId,
    required this.setId,
    required this.cardImage,
    required this.cardName,
    required this.team,

});

  factory LegendaryCard.fromJson(Map<String, dynamic> json) {
    return LegendaryCard(
        deckId: json['deckId'],
        setId: json['setId'],
        cardImage: json['cardImage'],
        cardName: json['cardName'],
        team: json['team']
    );
  }
}