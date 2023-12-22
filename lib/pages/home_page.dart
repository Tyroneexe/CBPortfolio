import 'package:cobus/themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundClr,
      body: Column(
        children: [
          Text(
            'hello world',
          ),
        ],
      ),
    );
  }
}
