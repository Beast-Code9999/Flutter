import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/currency_converter_material_page.dart';

void main() {
  runApp(const MyApp());
}

// Types of Widgets
// 1. StatelessWidget
// 2. StatefulWidget
// 3. Innherited Widget


// two types of design
// 1. Material Design
// 2. Cupertino Design

class MyApp extends StatelessWidget {
  //  create a constructor for MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: CurrencyConverterMaterialPage(),
      );
  }
}