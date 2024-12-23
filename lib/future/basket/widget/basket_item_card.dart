import 'package:coffe_shop_mobile_app/future/basket/model/basket_item_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/state/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketItemCard extends StatelessWidget {
  const BasketItemCard({required this.item, required this.size, super.key});

  final BasketItemModel item;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        item.coffee.name ?? '',
        style: AppCustomTextStyle.coffeeCardName(context),
      ),
      subtitle: Text(item.coffee.extra ?? '', style: AppCustomTextStyle.bodyMedium(context)),
      leading: Container(
        width: size.width * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(item.coffee.image ?? ''),
          ),
        ),
      ),
      trailing: SizedBox(
        width: size.width * 0.35,
        child: Row(
          children: [
            Text(
              item.coffee.price.toString(),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 10,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                BlocProvider.of<BasketBloc>(context).add(
                  MiktarAzalatma(
                    item.coffee,
                    -1,
                  ),
                );
              },
              icon: const Icon(
                Icons.remove,
                size: 23,
              ),
            ),
            Text(
              item.miktar.toString(),
              style: AppCustomTextStyle.bodyMedium(context),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                BlocProvider.of<BasketBloc>(context).add(
                  AddCoffee(
                    item.coffee,
                    1,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
