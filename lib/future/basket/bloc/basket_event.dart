part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddCoffeeToBasket extends BasketEvent {
  const AddCoffeeToBasket(this.coffee, this.miktar);
  final Coffee coffee;
  final int miktar;

  @override
  List<Object> get props => [coffee, miktar];
}

class DercreaseCoffeeFromBasket extends BasketEvent {
  const DercreaseCoffeeFromBasket(this.coffee, this.miktar);
  final Coffee coffee;
  final int miktar;

  @override
  List<Object> get props => [coffee, miktar];
}

class RemoveCoffeeFromBasket extends BasketEvent {
  const RemoveCoffeeFromBasket(this.coffee);
  final Coffee coffee;

  @override
  List<Object> get props => [coffee];
}
