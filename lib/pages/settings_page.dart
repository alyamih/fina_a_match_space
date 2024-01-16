import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:fina_a_match_space/pages/show_screen.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/home.png')),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/planet_with_center.png'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 33),
                                child: Stack(
                                  children: <Widget>[
                                    Text(
                                      'Settings',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = const Color(0Xff213350),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    const Text(
                                      'Settings',
                                      style: TextStyle(
                                        fontFamily: 'Trispace',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const ReadTermsOrPrivacyScreenView(
                                              link: 'google.com',
                                            )),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    children: <Widget>[
                                      Text(
                                        'Privacy Policy',
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
                                      const Text(
                                        'Privacy Policy',
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
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const ReadTermsOrPrivacyScreenView(
                                              link: 'google.com',
                                            )),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Stack(
                                    children: <Widget>[
                                      Text(
                                        'Terms Of Use',
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
                                      const Text(
                                        'Terms Of Use',
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Stack(
                                  children: <Widget>[
                                    Text(
                                      'Rate App',
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
                                    const Text(
                                      'Rate App',
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
                            ],
                          ),
                          Positioned(
                              left: -110,
                              top: 160,
                              child: Image.asset('assets/Astronaut_5.png')),
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
      ),
    );
  }
}
