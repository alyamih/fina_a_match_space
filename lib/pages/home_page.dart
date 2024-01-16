import 'dart:async';
import 'dart:convert';

import 'package:fina_a_match_space/model/game_model.dart';
import 'package:fina_a_match_space/model/level_item.dart';
import 'package:fina_a_match_space/model/user_item.dart';
import 'package:fina_a_match_space/pages/settings_page.dart';
import 'package:fina_a_match_space/pages/start_level_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserItem user = UserItem(score: 0, hp: 3);
GameModel game = GameModel();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LevelItem level1 = LevelItem(levelNumber: 1, isCompleted: false);
  LevelItem level2 = LevelItem(levelNumber: 2, isCompleted: false);
  LevelItem level3 = LevelItem(levelNumber: 3, isCompleted: false);
  LevelItem level4 = LevelItem(levelNumber: 4, isCompleted: false);
  LevelItem level5 = LevelItem(levelNumber: 4, isCompleted: false);
  Timer? timer;
  @override
  void initState() {
    super.initState();

    getSP(() {
      setState(() {});
    });
    timer = Timer.periodic(
      const Duration(minutes: 60),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        if (user.hp! < 5) {
          setState(() {
            user.hp = user.hp! + 1;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/back.png'))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        getHp()
                      ],
                    ),
                    //Image.asset('assets/Group4.png'),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 150,
                left: -70,
                child: Image.asset('assets/Astronaut_5.png')),
            Positioned(
                left: 130,
                top: 125,
                child: InkWell(
                    onTap: () {
                      if (user.hp != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartLevelPage(
                                    currentLevel: level1,
                                  )),
                        );
                      } else {
                        showHPDialog(context);
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/lvl1.png'),
                        if (level1.isCompleted!)
                          Positioned(
                              bottom: 55, child: Image.asset('assets/star.png'))
                      ],
                    ))),
            Positioned(
                left: 250,
                top: 200,
                child: InkWell(
                    onTap: () {
                      if (user.hp != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartLevelPage(
                                    currentLevel: level2,
                                  )),
                        );
                      } else {
                        showHPDialog(context);
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/lvl2.png'),
                        if (level2.isCompleted!)
                          Positioned(
                              bottom: 55, child: Image.asset('assets/star.png'))
                      ],
                    ))),
            Positioned(
                left: 380,
                top: 125,
                child: InkWell(
                    onTap: () {
                      if (user.hp != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartLevelPage(
                                    currentLevel: level3,
                                  )),
                        );
                      } else {
                        showHPDialog(context);
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/lvl3.png'),
                        if (level3.isCompleted!)
                          Positioned(
                              bottom: 55, child: Image.asset('assets/star.png'))
                      ],
                    ))),
            Positioned(
                left: 510,
                top: 200,
                child: InkWell(
                    onTap: () {
                      if (user.hp != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartLevelPage(
                                    currentLevel: level4,
                                  )),
                        );
                      } else {
                        showHPDialog(context);
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/lvl4.png'),
                        if (level4.isCompleted!)
                          Positioned(
                              bottom: 55, child: Image.asset('assets/star.png'))
                      ],
                    ))),
            Positioned(
                left: 640,
                top: 125,
                child: InkWell(
                    onTap: () {
                      if (user.hp != 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => StartLevelPage(
                                    currentLevel: level5,
                                  )),
                        );
                      } else {
                        showHPDialog(context);
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset('assets/lvl5.png'),
                        if (level5.isCompleted!)
                          Positioned(
                              bottom: 55, child: Image.asset('assets/star.png'))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  void showHPDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Not enough HP.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            content: Text(
              'Please, wait an hour.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17,
              ),
            ),
            actions: [
              Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                        child: const Text(
                          'Ok',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
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

Widget getHp() {
  List<Widget> list = [];
  for (var i = 0; i < user.hp!; i++) {
    list.add(Image.asset('assets/full_heart.png'));
  }
  if (user.hp == 2) {
    list.add(Image.asset('assets/empty_heart.png'));
  }
  if (user.hp == 1) {
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
  }
  if (user.hp == 0) {
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
    list.add(Image.asset('assets/empty_heart.png'));
  }
  return Row(
    children: list,
  );
}
