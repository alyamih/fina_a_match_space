import 'dart:convert';

import 'package:fina_a_match_space/model/level_item.dart';
import 'package:fina_a_match_space/model/user_item.dart';
import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:fina_a_match_space/pages/level_over_page.dart';
import 'package:fina_a_match_space/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.currentLevel});
  final LevelItem currentLevel;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  LevelItem level1 = LevelItem(levelNumber: 1, isCompleted: false);
  LevelItem level2 = LevelItem(levelNumber: 2, isCompleted: false);
  LevelItem level3 = LevelItem(levelNumber: 3, isCompleted: false);
  LevelItem level4 = LevelItem(levelNumber: 4, isCompleted: false);
  LevelItem level5 = LevelItem(levelNumber: 4, isCompleted: false);

  int matchedCard = 0;
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/back.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const SettingsPage()),
                                  );
                                },
                                child: Image.asset('assets/settings.png')),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const HomePage()),
                                  );
                                },
                                child: Image.asset('assets/home.png')),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/planet_with_center.png'),
                              Positioned(
                                  left: -180,
                                  top: 150,
                                  child: Image.asset(
                                    'assets/Astronaut_2.png',
                                    scale: 0.9,
                                  )),
                              Positioned(
                                top: 45,
                                child: SizedBox(
                                    height: 250,
                                    width: 250,
                                    child: GridView.builder(
                                        itemCount: game.images!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 16.0,
                                          mainAxisSpacing: 16.0,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                game.images![index] =
                                                    game.cards[index];
                                                game.matchCheck.add(
                                                    {index: game.cards[index]});
                                              });
                                              if (game.matchCheck.length == 2) {
                                                if (game.matchCheck[0].values
                                                            .first !=
                                                        "assets/find_a_match.png" &&
                                                    game.matchCheck[0].values
                                                            .first ==
                                                        game.matchCheck[1]
                                                            .values.first) {
                                                  game.matchCheck.clear();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000),
                                                      () {
                                                    matchedCard =
                                                        matchedCard + 2;
                                                    if (matchedCard == 8) {
                                                      if (game.currentLevel ==
                                                          level1.levelNumber) {
                                                        level1.isCompleted =
                                                            true;
                                                      } else if (game
                                                              .currentLevel ==
                                                          level2.levelNumber) {
                                                        level2.isCompleted =
                                                            true;
                                                      } else if (game
                                                              .currentLevel ==
                                                          level3.levelNumber) {
                                                        level3.isCompleted =
                                                            true;
                                                      } else if (game
                                                              .currentLevel ==
                                                          level4.levelNumber) {
                                                        level4.isCompleted =
                                                            true;
                                                      }
                                                      user.score =
                                                          user.score! + 15;

                                                      user.hp = user.hp! - 1;
                                                      addSP(
                                                          level1,
                                                          level2,
                                                          level3,
                                                          level4,
                                                          level5,
                                                          user);
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                        MaterialPageRoute<void>(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const LevelOverPage()),
                                                      );
                                                    }
                                                  });
                                                } else {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500),
                                                      () {
                                                    setState(() {
                                                      game.images![game
                                                              .matchCheck[0]
                                                              .keys
                                                              .first] =
                                                          game.hiddenCard;
                                                      game.images![game
                                                              .matchCheck[1]
                                                              .keys
                                                              .first] =
                                                          game.hiddenCard;
                                                      game.matchCheck.clear();
                                                    });
                                                  });
                                                }
                                              }
                                            },
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    image:
                                                        const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/find_a_match.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                game.images![index] !=
                                                        "assets/find_a_match.png"
                                                    ? Positioned(
                                                        left: 12,
                                                        child: Image.asset(
                                                          game.images![index],
                                                          scale: 6.0,
                                                        ),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          );
                                        })),
                              )
                            ],
                          ),
                        ),
                        getHp()
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addSP(LevelItem? level1, LevelItem? level2, LevelItem? level3,
      LevelItem? level4, LevelItem? level5, UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();

    String rawJson1 = jsonEncode(level1!.toJson());
    prefs.setString('level1', rawJson1);

    String rawJson2 = jsonEncode(level2!.toJson());
    prefs.setString('level2', rawJson2);

    String rawJson3 = jsonEncode(level3!.toJson());
    prefs.setString('level3', rawJson3);

    String rawJson4 = jsonEncode(level4!.toJson());
    prefs.setString('level4', rawJson4);

    String rawJson5 = jsonEncode(level5!.toJson());
    prefs.setString('level5', rawJson5);

    String rawJson6 = jsonEncode(user!.toJson());
    prefs.setString('user', rawJson6);
  }

  void getSP(Function() callback) async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson1 = prefs.getString('level1') ?? '';
    final rawJson2 = prefs.getString('level2') ?? '';
    final rawJson3 = prefs.getString('level3') ?? '';
    final rawJson4 = prefs.getString('level4') ?? '';
    final rawJson5 = prefs.getString('level5') ?? '';
    final rawJson6 = prefs.getString('user') ?? '';
    Map<String, dynamic> map1 = {};
    Map<String, dynamic> map2 = {};
    Map<String, dynamic> map3 = {};
    Map<String, dynamic> map4 = {};
    Map<String, dynamic> map5 = {};
    Map<String, dynamic> map6 = {};
    if (rawJson1.isNotEmpty) {
      map1 = jsonDecode(rawJson1);
    }
    if (rawJson2.isNotEmpty) {
      map2 = jsonDecode(rawJson2);
    }
    if (rawJson3.isNotEmpty) {
      map3 = jsonDecode(rawJson3);
    }
    if (rawJson4.isNotEmpty) {
      map4 = jsonDecode(rawJson4);
    }
    if (rawJson5.isNotEmpty) {
      map5 = jsonDecode(rawJson5);
    }
    if (rawJson6.isNotEmpty) {
      map6 = jsonDecode(rawJson6);
    }
    if (map1.isNotEmpty) {
      level1 = LevelItem.fromJson(map1);
    }
    if (map2.isNotEmpty) {
      level2 = LevelItem.fromJson(map2);
    }
    if (map3.isNotEmpty) {
      level3 = LevelItem.fromJson(map3);
    }
    if (map4.isNotEmpty) {
      level4 = LevelItem.fromJson(map4);
    }
    if (map5.isNotEmpty) {
      level5 = LevelItem.fromJson(map5);
    }
    if (map6.isNotEmpty) {
      user = UserItem.fromJson(map6);
    }
    callback();
  }
}
