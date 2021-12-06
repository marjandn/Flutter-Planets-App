import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final CarouselController _carouselController = new CarouselController();
  int _current = 0;

  final List<dynamic> _planets = [
    {
      'title': 'Earth',
      'image': 'earth.png',
      'description':
          'Earth is the third planet from the Sun and the only astronomical object known to harbour and support life. 29.2% of Earths surface is land consisting of continents and islands.'
    },
    {
      'title': 'Sun',
      'image': 'sun.png',
      'description': 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma,[18][19] heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet light'
    },
    {
      'title': 'Pluto',
      'image': 'plutu.png',
      'description': 'Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the first and the largest Kuiper belt object to be discovered. After Pluto was discovered in 1930, it was declared to be the ninth planet from the Sun'
    },
    {
      'title': 'Mars',
      'image': 'mars.png',
      'description': 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the "Red Planet".'
    },
    {
      'title': 'Jupiter',
      'image': 'jupiter.png',
      'description': 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, but slightly less than one-thousandth the mass of the Sun'
    },
    {
      'title': 'Mercury',
      'image': 'mercury.png',
      'description': 'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Suns planets. It is named after the Roman god Mercurius (Mercury), god of commerce, messenger of the gods, and mediator between gods and mortals,'
    },
    {
      'title': 'Neptune',
      'image': 'nepton.png',
      'description': 'Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, slightly more massive than its near-twin Uranus.'
    },
    {
      'title': 'Venus',
      'image': 'venus.png',
      'description': 'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the brightest natural object in Earths night sky after the Moon'
    }, 
  ];

  @override
  void initState() {
    super.initState();
  }

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
                child: Lottie.asset('assets/anim/planet.json',width: 200,),
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
              Align(
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
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    ),
                    carouselController: _carouselController,
                    items: _planets.map((planet) {
                      return Stack(children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity:
                              _current == _planets.indexOf(planet) ? 1.0 : 0.6,
                          child: Container(
                            height: 400,
                            margin: const EdgeInsets.only(top: 75, bottom: 35),
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
                                          maxLines:
                                              _current == _planets.indexOf(planet)
                                                  ? 3
                                                  : 1,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
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
                              opacity: _current == _planets.indexOf(planet)
                                  ? 1.0
                                  : 0.0,
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
                            ))
                      ]);
                    }).toList(),
                  ),
                ),
              )
            ])));
  }
}
