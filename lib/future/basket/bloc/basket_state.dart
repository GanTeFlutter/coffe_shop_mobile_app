part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();
  
  @override
  List<Object> get props => [];
}

class BasketInitial extends BasketState {}
