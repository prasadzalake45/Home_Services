import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:home_services/utils/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/walk_through_model.dart';
import '../utils/colors.dart';
import '../store/appData.dart';
import 'signin_screen.dart';


class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final controller = PageController();
  final appData = AppData(); 

  List<WalkThroughModel> list = [];
  double aspectRatio = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    list.add(
      WalkThroughModel(
        "Easy & Fast Services",
        "Book your services at your convenient time and enjoy the hassle-free process",
        contractor, // Keeping only this image
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  image: AssetImage(list[index].imagePath),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              height: aspectRatio < 0.48
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height * 0.40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 1, // Only one page
                              effect: ExpandingDotsEffect(
                                dotHeight: 10,
                                dotWidth: 10,
                                activeDotColor: activeDot,
                                expansionFactor: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              list[0].title, // Only one item now
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                            SizedBox(height: 16),
                            Text(
                              list[0].subTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Observer(
                          builder: (_) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: blackColor,
                              backgroundColor:
                                  appData.isDark ? Colors.black : whiteColor,
                              shape: StadiumBorder(),
                              fixedSize: Size(360, 50),
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: appData.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}