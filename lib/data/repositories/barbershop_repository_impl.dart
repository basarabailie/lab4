import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/entities/barbershop.dart';
import '../../domain/repositories/barbershop_repository.dart';
import '../models/barbershop_model.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  @override
  Future<List<Barbershop>> getNearestBarbershops() async {
    final String response = await rootBundle.loadString('assets/frizerii.json');
    final data = await json.decode(response);
    return (data['frizeriiApropiate'] as List)
        .map((item) => BarbershopModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<Barbershop>> getRecommendedBarbershops() async {
    final String response = await rootBundle.loadString('assets/frizerii.json');
    final data = await json.decode(response);
    return (data['frizeriiRecomandate'] as List)
        .map((item) => BarbershopModel.fromJson(item))
        .toList();
  }
}
