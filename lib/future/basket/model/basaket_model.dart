import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:equatable/equatable.dart';

//State sınıfı için bu modeli kullanacağımızdan dolayı Equatable sınıfından türetiyoruz.
class BaseBasketModel extends Equatable {
  const BaseBasketModel(this.baseBasket);

  final List<BasketItemModel> baseBasket;

  double get sepetToplaFiyat =>
      baseBasket.fold(0, (previousValue, element) => previousValue + element.tekUrunToplamFiyat);
  int get sepetToplamUrun =>
      baseBasket.fold(0, (previousValue, element) => previousValue + element.miktar);

  BaseBasketModel copyWith({
    List<BasketItemModel>? baseBasket,
  }) {
    return BaseBasketModel(
      baseBasket ?? this.baseBasket,
    );
  }

  @override
  List<Object?> get props => [baseBasket];
}
