import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fina_a_match_space/main.dart';
import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:fina_a_match_space/pages/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: const AssetImage('assets/back.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/icons/planet.png'),
                      Positioned(
                        left: 30,
                        top: 10,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Text(
                              'Find\na\nMatch',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Trispace',
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = const Color(0Xff213350),
                              ),
                            ),
                            // Solid text as fill.
                            const Text(
                              'Find\na\nMatch',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Trispace',
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      left: -180,
                      bottom: -80,
                      child: Image.asset('assets/Astronaut_2.png')),
                  Positioned(
                      right: -240,
                      top: -70,
                      child: Image.asset('assets/Astronaut_3.png')),
                ],
              )
            ],
          ),
        ),
      ),
      nextScreen: initScreen == 0 || initScreen == null
          ? const OnBoarding()
          : const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
