import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  const PriceTag(this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      child: Text(
        "\$$price",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
