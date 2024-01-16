import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:flutter/material.dart';

class LevelOverPage extends StatelessWidget {
  const LevelOverPage({super.key});

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
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute<void>(
                              //       builder: (BuildContext context) =>
                              //           const HomePage()),
                              // );
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/home.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/planet_with_center.png'),
                              Positioned(
                                  top: 110,
                                  right: 110,
                                  child: Stack(
                                    children: [
                                      Image.asset('assets/Astronaut_7.png'),
                                      Positioned(
                                        left: 15,
                                        top: 20,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Text(
                                              '+15',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Trispace',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 32,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 6
                                                  ..color =
                                                      const Color(0Xff213350),
                                              ),
                                            ),
                                            // Solid text as fill.
                                            const Text(
                                              '+15',
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
                                      )
                                    ],
                                  )),
                              Positioned(
                                top: 50,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Level ${game.currentLevel} is\nOver!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = const Color(0Xff213350),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                      'Level ${game.currentLevel} is\nOver!',
                                      textAlign: TextAlign.center,
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
                            ],
                          ),
                        ),
                        getHp()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 20,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage()),
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/botton.png'))),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
