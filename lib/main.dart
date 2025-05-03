//import 'package:english_words/english_words.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({super.key});

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

    'Ford Mustang',

    'Chevrolet Camaro',

    'Tesla Model S',

    'Toyota Corolla',

    'Honda Civic',

    'BMW M3',

    'Audi A4',

    'Mercedes-Benz C-Class',

    'Porsche 911',

    'Lamborghini Aventador'

  ];

  String currentCar = 'Click Next';

  void getNext() {

    final random = Random();

    currentCar = carNames[random.nextInt(carNames.length)];

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

            ElevatedButton(

              onPressed: () => appState.getNext(),

              child: Text('Next'),

            ),

          ],
        ),
      ),
    );
  }
}