import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:planets_app/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF1e71b7),
                    Color(0xFF272973),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Lottie.asset(
                  'assets/anim/planet.json',
                  width: 200,
                ),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Text("Space Explorer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24)),
                  )),
              Obx(() => Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0, top: 110),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 450,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.5,
                          initialPage: 0,
                          autoPlay: _controller.sliderAutoPlay.value,
                          onPageChanged: (index, reason) {
                            _controller.currentSlide(index);
                          },
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        ),
                        items: _controller.planets.map((planet) {
                          return Stack(children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 800),
                              opacity: _controller.currentSlide.value ==
                                      _controller.planets.indexOf(planet)
                                  ? 1.0
                                  : 0.6,
                              child: Container(
                                height: 400,
                                margin:
                                    const EdgeInsets.only(top: 75, bottom: 35),
                                padding: const EdgeInsets.only(
                                    top: 130, right: 16, left: 16, bottom: 35),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              planet['title'],
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              planet['description'],
                                              maxLines: _controller
                                                          .currentSlide.value ==
                                                      _controller.planets
                                                          .indexOf(planet)
                                                  ? 3
                                                  : 1,
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 16,
                              left: 16,
                              child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x86575757),
                                        blurRadius: 40.0,
                                        spreadRadius: 0.2,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: Image.asset(
                                    "assets/images/${planet['image']}",
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 16,
                                left: 16,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: _controller.currentSlide.value ==
                                          _controller.planets.indexOf(planet)
                                      ? 1.0
                                      : 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      _controller.sliderAutoPlay(false);

                                      _controller.openDetailes(planet);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35,
                                      child: Image.asset(
                                        "assets/images/right_arrow.png",
                                        fit: BoxFit.fill,
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                ))
                          ]);
                        }).toList(),
                      ),
                    ),
                  )),
              Obx(()=> AnimatedPositioned(
                width: _controller.detailsExpanded.value ? Get.width : 0,
                height: _controller.detailsExpanded.value ? Get.height : 0,
                right: 0,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  margin: const EdgeInsets.all(32),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                _controller.detailsExpanded(false);
                                _controller.sliderAutoPlay(true);
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.grey,
                              )),
                        ),
                        Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x86575757),
                                  blurRadius: 40.0,
                                  spreadRadius: 0.2,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/${_controller.selectedPlanetImage}",
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            )),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                _controller.selectedPlanetName,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                _controller.selectedPlanetDesc,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ])));
  }
}
