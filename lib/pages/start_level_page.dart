import 'package:fina_a_match_space/model/level_item.dart';
import 'package:fina_a_match_space/pages/game_page.dart';
import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:fina_a_match_space/pages/settings_page.dart';
import 'package:flutter/material.dart';

class StartLevelPage extends StatelessWidget {
  const StartLevelPage({super.key, required this.currentLevel});
  final LevelItem currentLevel;

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
                                  Navigator.pop(context);
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
                                  left: -100,
                                  top: 160,
                                  child: Image.asset('assets/Astronaut_5.png')),
                              Positioned(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: <Widget>[
                                          Text(
                                            'Level ${currentLevel.levelNumber}',
                                            style: TextStyle(
                                              fontFamily: 'Trispace',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 6
                                                ..color =
                                                    const Color(0Xff213350),
                                            ),
                                          ),
                                          Text(
                                            'Level ${currentLevel.levelNumber}',
                                            style: const TextStyle(
                                              fontFamily: 'Trispace',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 27),
                                      child: Stack(
                                        children: <Widget>[
                                          Text(
                                            'Find all matches',
                                            style: TextStyle(
                                              fontFamily: 'Trispace',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 6
                                                ..color =
                                                    const Color(0Xff213350),
                                            ),
                                          ),
                                          // Solid text as fill.
                                          const Text(
                                            'Find all matches',
                                            style: TextStyle(
                                              fontFamily: 'Trispace',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        game.currentLevel =
                                            currentLevel.levelNumber;
                                        game.initCards();
                                        game.initNewGame();
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  GamePage(
                                                    currentLevel: currentLevel,
                                                  )),
                                        );
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/planet_blue.png',
                                            scale: 0.8,
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Start',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trispace',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 32,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 6
                                                    ..color =
                                                        const Color(0Xff213350),
                                                ),
                                              ),
                                              // Solid text as fill.
                                              const Text(
                                                'Start',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Trispace',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 32,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
}
