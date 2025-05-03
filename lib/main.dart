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

   // final query = currentCar.replaceAll(' ', '+');
   imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Lamborghini_Aventador_%282021%29_IMG_4846.jpg/640px-Lamborghini_Aventador_%282021%29_IMG_4846.jpg';
    //print('Image URL: $imageUrl');

    //final fallback = 'car';
    //final query = currentCar.split(' ').first; // just brand name
    //imageUrl = 'https://source.unsplash.com/600x400/?$query,$fallback';

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
              Image.network(
                appState.imageUrl,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    children: [
                      Icon(Icons.error, size: 50),
                      Text('Image failed to load'),
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