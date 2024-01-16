class UserItem {
  int? hp;
  int? score;

  UserItem({this.hp = 3, this.score});

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      hp: parsedJson['hp'] ?? "",
      score: parsedJson['score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hp': hp,
      'score': score,
    };
  }
}
