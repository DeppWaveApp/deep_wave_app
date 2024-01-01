import 'package:deepwave/mocks/onboarding_texts.dart';
import 'package:deepwave/utils/theme/colors.dart';
import 'package:deepwave/utils/theme/custome_text_theme.dart';
import 'package:deepwave/widgets/buttons/onboarding_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnboardingScreen(),
    );
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: OnboardingContent.content.map((onboardContent) {
                return buildPageContent(
                  title1: onboardContent["title1"],
                  title2: onboardContent["title2"],
                  text: onboardContent["text"],
                  image: onboardContent["image"],
                  currentPage: _currentPage,
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingNavButton(
                    type: 'back',
                    icon: Icons.arrow_back,
                    index: _currentPage,
                    navigate: () {
                      if (_currentPage != 0) {
                        _pageController.animateToPage(_currentPage - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      }
                    }),
                SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 3,
                  // forcing the indicator to use a specific direction
                  textDirection: TextDirection.ltr,
                  effect: const WormEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: AppColors.secondaryColorLight,
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 10,
                  ),
                ),
                OnboardingNavButton(
                  type: 'next',
                  icon: Icons.arrow_forward,
                  index: _currentPage,
                  navigate: () {
                    if (_currentPage == OnboardingContent.content.length - 1) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          SignupScreen.routeName,
                          ModalRoute.withName('/signup'));
                    } else {
                      _pageController.animateToPage(_currentPage + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildPageContent(
      {String? title1, title2, String? text, image, currentPage}) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  },
                  child: currentPage != 2
                      ? Text('Skip',
                          style: Theme.of(context).textTheme.displaySmall)
                      : Container(),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    image,
                    width: 350,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  // child: Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.center,
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const SizedBox(height: 40),
                              Text(
                                title1!,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                title2!,
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            text!,
                            style: CustomTextTheme.onboardingText(context)!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Add onboarding image

            // add title and text
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
