import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentSlide = 0.obs;
  var sliderAutoPlay = true.obs;
  var detailsExpanded = false.obs;

  String selectedPlanetName = "";
  String selectedPlanetImage = "";
  String selectedPlanetDesc = "";

  final List<dynamic> planets = [
    {
      'title': 'Earth',
      'image': 'earth.png',
      'description':
          'Earth is the third planet from the Sun and the only astronomical object known to harbour and support life. 29.2% of Earths surface is land consisting of continents and islands.'
    },
    {
      'title': 'Sun',
      'image': 'sun.png',
      'description':
          'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma,[18][19] heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet light'
    },
    {
      'title': 'Pluto',
      'image': 'plutu.png',
      'description':
          'Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the first and the largest Kuiper belt object to be discovered. After Pluto was discovered in 1930, it was declared to be the ninth planet from the Sun'
    },
    {
      'title': 'Mars',
      'image': 'mars.png',
      'description':
          'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the "Red Planet".'
    },
    {
      'title': 'Jupiter',
      'image': 'jupiter.png',
      'description':
          'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, but slightly less than one-thousandth the mass of the Sun'
    },
    {
      'title': 'Mercury',
      'image': 'mercury.png',
      'description':
          'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Suns planets. It is named after the Roman god Mercurius (Mercury), god of commerce, messenger of the gods, and mediator between gods and mortals,'
    },
    {
      'title': 'Neptune',
      'image': 'nepton.png',
      'description':
          'Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, slightly more massive than its near-twin Uranus.'
    },
    {
      'title': 'Venus',
      'image': 'venus.png',
      'description':
          'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the brightest natural object in Earths night sky after the Moon'
    },
  ];

  openDetailes(planet) {
    selectedPlanetName = planet['title'];
    selectedPlanetImage = planet['image'];
    selectedPlanetDesc = planet['description'];

    detailsExpanded(true);

  }
}
