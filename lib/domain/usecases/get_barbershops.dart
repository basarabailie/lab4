import '../entities/barbershop.dart';
import '../repositories/barbershop_repository.dart';

class GetBarbershopsUseCase {
  final BarbershopRepository repository;

  GetBarbershopsUseCase(this.repository);

  Future<List<Barbershop>> getNearestBarbershops() {
    return repository.getNearestBarbershops();
  }

  Future<List<Barbershop>> getRecommendedBarbershops() {
    return repository.getRecommendedBarbershops();
  }
}
