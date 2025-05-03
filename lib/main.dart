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

    'Ford Mustang', 'Chevrolet Camaro', 'Tesla Model S', 'Toyota Corolla', 'Honda Civic', 'BMW M3',
    'Audi A4', 'Mercedes-Benz C-Class', 'Porsche 911', 'Lamborghini Aventador',
    'Ferrari F8', 'Dodge Charger', 'Nissan GT-R', 'Jeep Wrangler', 'Hyundai Elantra',
    'Kia Optima', 'Volkswagen Golf', 'Subaru Impreza', 'Mazda MX-5', 'Chrysler 300',
    'Volvo S60', 'Jaguar XF', 'Cadillac CTS', 'Infiniti Q50', 'Acura TLX',
    'Lincoln MKZ', 'Alfa Romeo Giulia', 'Genesis G70', 'Buick Regal', 'Mini Cooper',
    'Chevy Malibu', 'Toyota Camry', 'Ford Fusion', 'Hyundai Sonata', 'Honda Accord',
    'Dodge Dart', 'Nissan Altima', 'BMW 5 Series', 'Audi A6', 'Mercedes E-Class',
    'Tesla Model 3', 'Chevrolet Impala', 'Toyota Avalon', 'Lexus IS', 'Mazda6',
    'Kia Stinger', 'Volvo V60', 'Jaguar XE', 'Buick LaCrosse', 'Cadillac CT5',
    'Chrysler Sebring', 'Ford Taurus', 'Pontiac G6', 'Oldsmobile Alero', 'Saturn Ion',
    'Peugeot 508', 'Renault Talisman', 'Fiat Tipo', 'Skoda Superb', 'Seat Leon',
    'Citroen C5', 'Dacia Logan', 'Opel Insignia', 'Holden Commodore', 'Proton Persona',
    'Mitsubishi Lancer', 'Suzuki Swift', 'Isuzu Bellett', 'Daihatsu Charade', 'Perodua Myvi',
    'Tata Nexon', 'Mahindra XUV500', 'Maruti Baleno', 'Hyundai Verna', 'Honda City',
    'Toyota Yaris', 'Ford EcoSport', 'Nissan Micra', 'Chevrolet Spark', 'Kia Rio',
    'Mazda 3', 'Subaru Legacy', 'Volkswagen Passat', 'Skoda Octavia', 'Renault Megane',
    'Lancia Delta', 'Peugeot 308', 'Citroen C4', 'Chery Arrizo 5', 'Geely Emgrand',
    'Great Wall C30', 'BAIC D50', 'Haval H6', 'BYD Qin', 'NIO ET7',
    'XPeng P7', 'Li Auto L9', 'Lucid Air', 'Rivian R1T', 'Bollinger B1',
    'Fisker Ocean', 'Aptera SEV', 'Faraday Future FF91', 'VinFast VF8', 'Ora Cat',
    'Renault Zoe', 'BMW i3', 'Nissan Leaf', 'Chevy Bolt', 'Tesla Model X',
    'Tesla Cybertruck', 'Hyundai Ioniq 5', 'Kia EV6', 'Ford F-150 Lightning', 'Rivian R1S',
    'Honda e', 'Mazda MX-30', 'Mini Electric', 'Volkswagen ID.4', 'Skoda Enyaq',
    'Peugeot e-208', 'Fiat 500e', 'Renault Twizy', 'Citroen Ami', 'Smart EQ ForTwo',
    'Polestar 2', 'Lucid Gravity', 'Tesla Roadster', 'BMW i8', 'Audi e-tron GT',
    'Porsche Taycan', 'Mercedes EQS', 'Genesis GV60', 'Jaguar I-Pace', 'Nissan Ariya',
    'Chevrolet Blazer EV', 'GMC Hummer EV', 'Cadillac Lyriq', 'Fisker Pear', 'Hyundai Kona Electric',
    'Kia Niro EV', 'Toyota bZ4X', 'Subaru Solterra', 'Ford Mustang Mach-E', 'Honda Prologue',
    'Volvo XC40 Recharge', 'Mazda CX-30 EV', 'Buick Electra', 'Opel Mokka-e', 'DS 3 Crossback E-Tense',
    'Cupra Born', 'BYD Dolphin', 'Ora Funky Cat', 'Leapmotor C11', 'Seres SF5',
    'Geely Geometry C', 'Neta U', 'Voyah Free', 'IM L7', 'Avatr 11',
    'Aito M5', 'HiPhi X', 'Tesla Semi', 'Nikola Tre', 'Lordstown Endurance',
    'Karma Revero', 'Bollinger B2', 'Canoo Lifestyle Van', 'Arrival Van', 'BrightDrop Zevo 600',
    'Workhorse W-15', 'RAM 1500 REV', 'Ford Ranger Raptor', 'Jeep Gladiator', 'Chevy Colorado ZR2',
    'GMC Sierra EV', 'Toyota Tundra Hybrid', 'Nissan Titan XD', 'Honda Ridgeline', 'Hyundai Santa Cruz'
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