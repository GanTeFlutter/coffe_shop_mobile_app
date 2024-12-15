import 'package:coffe_shop_mobile_app/future/basket/basket_view_model.dart';
import 'package:coffe_shop_mobile_app/future/basket/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/widget/custom_elevated_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/state/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/widget/applicaton_default_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketView'),
        actions: [
          IconButton(
            onPressed: () {
              locationSlectedButton(context);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: ApplicationColors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Color.fromRGBO(103, 75, 65, 0.502),
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Delivery Address',
                      style: CustomTextStylee.titleMedium(context),
                    ),
                  ),
                  BlocBuilder<SingleAddressBlocBloc, SingleAddressBlocState>(
                    builder: (context, state) {
                      if (state is SingleAddressBlocLoaded) {
                        return ListTile(
                          title: Text(state.address.name ?? 'Lütfen bir Konum Seçiniz'),
                          subtitle: Text(state.address.description ?? 'Lütfen bir Konum Seçiniz'),
                          leading: const Icon(
                            Icons.business_sharp,
                            color: ApplicationColors.kahve,
                          ),
                        );
                      } else {
                        return const Text(
                          'Lütfen bir Address Belirleyiniz',
                          style: TextStyle(
                            color: ApplicationColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    },
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: size.width * 0.09,
                      ),
                      CustomElevatedButtonBasket(
                        onPressed: () {},
                        data: 'Change Address',
                        icon: Icons.edit_location_alt_outlined,
                      ),
                      CustomElevatedButtonBasket(
                        onPressed: () {},
                        data: 'Add Note',
                        icon: Icons.edit,
                      ),
                    ],
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Color.fromRGBO(103, 75, 65, 0.502),
                    thickness: 1,
                  ),
                  ElevatedButton(onPressed: () {
                         BlocProvider.of<BasketBloc>(context).add(
                            AddCoffeeToBasket(
                              damyCoffeeList[0],
                              1,
                            ),
                          );


                  }, child: const Text('Add to Basket')),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: damyCoffeeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(damyCoffeeList[index].id ?? 'id'),
                        subtitle: Text(damyCoffeeList[index].description ?? ''),
                        leading: const Icon(
                          Icons.coffee,
                          color: ApplicationColors.kahve,
                        ),
                        onTap: () {
                          BlocProvider.of<BasketBloc>(context).add(
                            AddCoffeeToBasket(
                              damyCoffeeList[index],
                              1,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      if (state is BasketInitial) {
                        return const Center(child: Text('Sepetiniz Boş'));
                      }
                      if (state is BasketLoaded) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket.items.length,
                          itemBuilder: (context, index) {
                            final item = state.basket.items[index];
                            return ListTile(
                              title: Text(item.coffee.id!),
                              subtitle: Text('${item.miktar} x ${item.coffee.name}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<BasketBloc>(context).add(
                                        DercreaseCoffeeFromBasket(
                                          item.coffee,
                                          1,
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<BasketBloc>(context).add(
                                        RemoveCoffeeFromBasket(
                                          item.coffee,
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('Sepetiniz Boş');
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextStylee {
  static TextStyle titleMedium(BuildContext context) {
    return GoogleFonts.b612(
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ApplicationColors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.b612(
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[500],
          ),
    );
  }
}
