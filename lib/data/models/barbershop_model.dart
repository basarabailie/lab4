
import '../../domain/entities/barbershop.dart';

class BarbershopModel extends Barbershop {
  BarbershopModel({
    required String name,
    required String distance,
    required double rating,
    required String image,
  }) : super(
          name: name,
          distance: distance,
          rating: rating,
          image: image,
        );

  factory BarbershopModel.fromJson(Map<String, dynamic> json) {
    return BarbershopModel(
      name: json['nume'],
      distance: json['distanta'],
      rating: json['rating'].toDouble(),
      image: json['imagine'],
    );
  }
}
