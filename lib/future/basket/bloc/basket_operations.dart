import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';

class BasketOperations {
  const BasketOperations._();

  static List<BasketItemModel> updateBasketItems({
    required List<BasketItemModel> items,
    required Coffee coffee,
    required int quantity,
  }) {
    final index = items.indexWhere((item) => item.coffee.id == coffee.id);

    if (index != -1) {
      items[index] = items[index].copyWith(
        miktar: items[index].miktar + quantity,
      );
    } else {
      items.add(BasketItemModel(coffee: coffee, miktar: quantity));
    }

    return items;
  }

  static List<BasketItemModel> decreaseItemQuantity({
    required List<BasketItemModel> items,
    required int index,
    required int quantity,
  }) {
    final item = items[index];

    if (item.miktar > 1) {
      items[index] = item.copyWith(miktar: item.miktar - quantity);
    } else {
      items.removeAt(index);
    }

    return items;
  }

  static int findItemIndex(List<BasketItemModel> items, int id) {
    return items.indexWhere((item) => item.coffee.id == id.toString());
  }
}
