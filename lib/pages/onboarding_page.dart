import 'package:fina_a_match_space/pages/home_page.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int page = 1;
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
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            if (page == 1) Image.asset('assets/Onboarding.png'),
                            if (page == 2)
                              Image.asset('assets/Onboarding2.png'),
                            Positioned(
                                bottom: 20,
                                right: -220,
                                child: Image.asset('assets/Astronaut_3.png')),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: -50,
                      bottom: -95,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                if (page == 1) {
                                  page = 2;
                                  setState(() {});
                                } else {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const HomePage()),
                                  );
                                }
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/botton.png'))),
                              )),
                        ],
                      ),
                    )
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
