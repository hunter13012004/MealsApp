import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/utils/walkthrough.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();

  int currentpageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              currentpageindex = value;
            });
            currentpageindex = value;
          },
          children: const <Widget>[
            WalkthroughPage(
              title: 'Discover Delicious Meals',
              description:
                  'Explore a wide variety of mouthwatering dishes from local restaurants and chefs',
              image:
                  'assets/images/cuisine.png', // Replace with your image path
            ),
            WalkthroughPage(
              title: ' Easy Ordering Process',
              description:
                  'Place your order in just a few taps. Customize your meal, select delivery or pickup, and pay securely right from your phone.',
              image:
                  'assets/images/delivery.png', // Replace with your image path
            ),
            WalkthroughPage(
              title: 'Fresh Ingredients, Fast Delivery',
              description:
                  ' We source the freshest ingredients to ensure your meal is of the highest quality. Enjoy swift delivery right to your doorstep',
              image:
                  'assets/images/ingredient.png', // Replace with your image path
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 50),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect:
                  const WormEffect(dotColor: primarycolor, activeDotColor: textcolor),
            ),
          ),
        ),
        currentpageindex == 2
            ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0, bottom: 30),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 50,
                        color: primarycolor,
                      )),
                ))
            : Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: () {
                  _pageController.jumpToPage(2);
                }, child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Skip',style: TextStyle(color: textcolor,fontSize: 20),),
                )),
              )
      ]),
    );
  }
}
