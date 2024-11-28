
// Events
import 'package:bloc/bloc.dart';

import '../../domain/entities/barbershop.dart';
import '../../domain/usecases/get_barbershops.dart';

abstract class BarbershopEvent {}

class LoadBarbershopsEvent extends BarbershopEvent {}

// States
abstract class BarbershopState {}

class BarbershopInitial extends BarbershopState {}

class BarbershopLoading extends BarbershopState {}

class BarbershopLoaded extends BarbershopState {
  final List<Barbershop> nearestBarbershops;
  final List<Barbershop> recommendedBarbershops;

  BarbershopLoaded(this.nearestBarbershops, this.recommendedBarbershops);
}

class BarbershopError extends BarbershopState {
  final String message;
  BarbershopError(this.message);
}

class BarbershopBloc extends Bloc<BarbershopEvent, BarbershopState> {
  final GetBarbershopsUseCase getBarbershopsUseCase;

  BarbershopBloc(this.getBarbershopsUseCase) : super(BarbershopInitial()) {
    on<LoadBarbershopsEvent>((event, emit) async {
      emit(BarbershopLoading());
      try {
        final nearestBarbershops =
            await getBarbershopsUseCase.getNearestBarbershops();
        final recommendedBarbershops =
            await getBarbershopsUseCase.getRecommendedBarbershops();
        emit(BarbershopLoaded(nearestBarbershops, recommendedBarbershops));
      } catch (e) {
        emit(BarbershopError(e.toString()));
      }
    });
  }
}
