import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:planets_app/home/home_page.dart';

void main() {
  group(
    'Test Home page',
    () => {
      
      testWidgets(
        'Given user click on arrow button When first planet load Then show animate popup',
        (WidgetTester tester) async {
          // ASSUMBLE
          await tester.pumpWidget(MaterialApp(
            home: HomePage(),
          ));
          final arrowButton = find.byKey(const ValueKey('Earth'));

          // ACT
          await tester.tap(arrowButton);
          await tester.pump();

          final popup = find.byKey(const ValueKey('detailesPopup'));
          final popupWidget =
              popup.evaluate().single.widget as AnimatedPositioned;

          // ASSERT
          expect(popupWidget.width, Get.width);
        },
      ),
      testWidgets(
          'Given user click on Earth planet When on Planet card click Then details popup title is Earth',
          (WidgetTester tester) async {
        // ASSUMBLE
        await tester.pumpWidget(MaterialApp(
          home: HomePage(),
        ));
        final moonArrow = find.byKey(const ValueKey("Earth"));

        // ACT
        await tester.tap(moonArrow);
        await tester.pump();
        final detailesPopupTitle =
            find.byKey(const ValueKey('detailPopupTitle'));
        Text animatedPositioned =
            detailesPopupTitle.evaluate().single.widget as Text;

        // ASSERT
        expect(animatedPositioned.data, "Earth");
      })
    },
  );
}
