part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddCoffee extends BasketEvent {
  const AddCoffee(this.coffee, this.miktar);
  final Coffee coffee;
  final int miktar;

  @override
  List<Object> get props => [coffee, miktar];
}

class MiktarAzalatma extends BasketEvent {
  const MiktarAzalatma(this.coffee, this.miktar);
  final Coffee coffee;
  final int miktar;

  @override
  List<Object> get props => [coffee, miktar];
}

class RemoveBasket extends BasketEvent {
  const RemoveBasket();
}
