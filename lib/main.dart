import 'package:flutter/material.dart';

import 'home/home_page.dart';
 

 /* 
  Progrun.ir
  This site is our resume 
  */
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      theme: ThemeData(
          fontFamily: 'Glory',
          primaryColor: const Color(0xFFFEFCFF), 
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xFFFEFCFF),
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.black, displayColor: Colors.black, fontFamily: 'Glory'),
      ),
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
