import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/barbershop.dart';
class BarbershopSection extends StatelessWidget {
  final String title;
  final List<Barbershop> barbershops;

  const BarbershopSection({
    required this.title,
    required this.barbershops,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: barbershops.length,
            itemBuilder: (context, index) {
              final barbershop = barbershops[index];
              return Card(
                child: Container(
                  width: 160,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(barbershop.image,
                          height: 90, fit: BoxFit.cover),
                      Text(barbershop.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(barbershop.distance),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(barbershop.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
