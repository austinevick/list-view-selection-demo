import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final width = TextEditingController();
  final length = TextEditingController();
  final cost = TextEditingController();
  double get getWidth => double.parse(width.text);
  double get getLength => double.parse(length.text);
  double get getCost => double.parse(cost.text);

  double get getArea => getWidth * getLength;

  double get getTotalCost => getArea * getCost;
  String total = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: width,
                  decoration: const InputDecoration(hintText: 'Width'),
                ),
                TextField(
                  controller: length,
                  decoration: const InputDecoration(hintText: 'Length'),
                ),
                TextField(
                  controller: cost,
                  decoration: const InputDecoration(hintText: 'Cost'),
                ),
                const SizedBox(height: 45),
                MaterialButton(
                  minWidth: 280,
                  height: 48,
                  color: Colors.green,
                  onPressed: () {
                    setState(() => total = getTotalCost.toString());
                    print(getTotalCost);
                  },
                  child: const Text('CALCULATE'),
                ),
                Text(total)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
