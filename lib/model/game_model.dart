class GameModel {
  List<String>? images;
  int? currentLevel;

  final String hiddenCard = "assets/find_a_match.png";
  List<String> cards = [];
  int count = 9;
  List<Map<int, String>> matchCheck = [];

  void initNewGame() {
    images = List.generate(count, (index) => hiddenCard);
  }

  void initCards() {
    if (currentLevel == 1) {
      cards = [
        "assets/icons/planet4.png",
        "assets/icons/planet2.png",
        "assets/icons/planet3.png",
        "assets/icons/planet5.png",
        "assets/icons/planet4.png",
        "assets/icons/planet3.png",
        "assets/icons/planet5.png",
        "assets/icons/planet2.png",
        "assets/find_a_match.png",
      ];
    } else if (currentLevel == 2) {
      cards = [
        "assets/icons/planet5.png",
        "assets/icons/planet3.png",
        "assets/icons/planet2.png",
        "assets/find_a_match.png",
        "assets/icons/planet4.png",
        "assets/icons/planet2.png",
        "assets/icons/planet5.png",
        "assets/icons/planet4.png",
        "assets/icons/planet3.png",
      ];
    } else if (currentLevel == 3) {
      cards = [
        "assets/icons/planet3.png",
        "assets/icons/planet2.png",
        "assets/icons/planet5.png",
        "assets/icons/planet4.png",
        "assets/icons/planet3.png",
        "assets/icons/planet4.png",
        "assets/icons/planet2.png",
        "assets/find_a_match.png",
        "assets/icons/planet5.png",
      ];
    } else if (currentLevel == 4) {
      cards = [
        "assets/icons/planet2.png",
        "assets/icons/planet3.png",
        "assets/icons/planet7.png",
        "assets/icons/planet4.png",
        "assets/find_a_match.png",
        "assets/icons/planet7.png",
        "assets/icons/planet3.png",
        "assets/icons/planet4.png",
        "assets/icons/planet2.png",
      ];
    } else if (currentLevel == 5) {
      cards = [
        "assets/icons/planet2.png",
        "assets/icons/planet4.png",
        "assets/icons/planet7.png",
        "assets/icons/planet5.png",
        "assets/icons/planet2.png",
        "assets/icons/planet4.png",
        "assets/find_a_match.png",
        "assets/icons/planet5.png",
        "assets/icons/planet7.png",
      ];
    }
  }
}
