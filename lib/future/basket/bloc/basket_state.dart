part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketInitial extends BasketState {}

class BasketLoaded extends BasketState {
  const BasketLoaded({required this.basket,required this.toplamAdet,required this.toplamTutar});

  final BaseBasketModel basket;
  final int toplamAdet;
  final double toplamTutar;

  @override
  List<Object> get props => [basket, toplamAdet, toplamTutar];
}

class BasketError extends BasketState {
  const BasketError({required this.errorMessage});
  final String errorMessage;
}
