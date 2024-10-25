import 'package:flutter/material.dart';
import 'package:uts_poemrogaman4_rayhan/input.dart';
import 'package:uts_poemrogaman4_rayhan/output.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UTS Pemrogaman 4',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        initialRoute: InputPage.routeName,
        routes: {
          InputPage.routeName: (context) => const InputPage(),
          OutputPage.routeName: (context) => const OutputPage(
                name: '',
                code: '',
                product: '',
                price: 0,
                amount: 0,
                totalPrice: 0,
                discount: 0.0,
              ),
        });
  }
}
