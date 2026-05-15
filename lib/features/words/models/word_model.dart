class WordModel {
  final int? wordId;
  final String engWordName;
  final String turWordName;
  final String? picture;

  WordModel({
    this.wordId,
    required this.engWordName,
    required this.turWordName,
    this.picture,
  });

  Map<String , dynamic> toMap() {
    return {
      'wordId': wordId,
      'engWordName': engWordName,
      'turWordName': turWordName,
      'picture': picture,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      wordId: map['wordId'],
      engWordName: map['engWordName'],
      turWordName: map['turWordName'],
      picture: map['picture'],
    );
  }

}