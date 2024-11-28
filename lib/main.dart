import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab4/presentation/pages/barbershop_page.dart';

void main() {
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbershop App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: BarbershopPage(),
    );
  }
}
