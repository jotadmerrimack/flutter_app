import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Random Car Generator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final List<String> carNames = [
 "Audi","BMW","Cadillac", "Chevrolet","Dodge","Fiat","Ford","Honda",
 "Hyundai","Jeep","Kia","Lamborghini","Mazda","Mercedes","Nissan",
  "Subaru","Tesla","Toyota","Volkswagen","Volvo"
  ];

  String currentCar = 'Click Next';
  String imageUrl = ''; 

  void getNext() {

    final random = Random();

    currentCar = carNames[random.nextInt(carNames.length)];
    imageUrl = ''; // clear old image
    notifyListeners();
  }
  void getImage() {
  final brand = currentCar.split(' ').first.toLowerCase();
  imageUrl = 'lib/assests/images/$brand.jpg';
  notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(

      appBar: AppBar(

        title: Text('Random Car Generator'),

      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(

              appState.currentCar,

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

            ),

            SizedBox(height: 20),


            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                ElevatedButton(

                  onPressed: () => appState.getNext(),

                  child: Text('Next'),

                ),

                SizedBox(width: 10),

                ElevatedButton(

                  onPressed: () => appState.getImage(),

                  child: Text('Picture'),

                ),

              ],

            ),

            SizedBox(height: 20),

          if (appState.imageUrl.isNotEmpty)
            Image.asset(
              appState.imageUrl,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Column(
                  children: [
                    Icon(Icons.error, size: 50),
                    Text('Image not found'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}