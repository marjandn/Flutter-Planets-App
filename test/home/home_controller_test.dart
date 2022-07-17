import 'package:flutter_test/flutter_test.dart';
import 'package:planets_app/home/home_controller.dart';

void main() {
  test('Given Moon planet When user open detail Then show details of Moon', () async {
    // Arrange 
    final controller = HomeController();
    final planet = {
      'title': 'Moon',
      'image': 'moon.png',
      'description':'some info about moon'
    };

    // Act
    controller.openDetailes(planet);

    // Assert
    expect(controller.selectedPlanetName, "Moon");
  });
  
}