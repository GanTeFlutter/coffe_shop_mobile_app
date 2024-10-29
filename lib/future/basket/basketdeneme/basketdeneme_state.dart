part of 'basketdeneme_cubit.dart';

abstract class BasketdenemeState extends Equatable {
  const BasketdenemeState();

  @override
  List<Object> get props => [];
}

class BasketdenemeInitial extends BasketdenemeState {
  final int basketSayi;

  const BasketdenemeInitial({required this.basketSayi});

  @override
  List<Object> get props => [basketSayi];
}
