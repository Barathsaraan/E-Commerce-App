import 'package:flutter/material.dart';

class SpareProducts extends StatefulWidget {
  const SpareProducts({super.key});

  @override
  State<SpareProducts> createState() => _SpareProductsState();
}

class _SpareProductsState extends State<SpareProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spare Products Details")),
    );
  }
}
