import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/FlippingCard.dart';

class Homecreen extends StatefulWidget {
  const Homecreen({super.key});

  @override
  State<Homecreen> createState() => _HomecreenState();
}

class _HomecreenState extends State<Homecreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          child: Text("Quick Calculation"),
        )
      ],
    );
  }
}