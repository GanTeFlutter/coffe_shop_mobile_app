import 'package:coffe_shop_mobile_app/future/home/bloc/home_bloc.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view_model.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/coffee_card.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/custom_textfield.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/filter_button.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/kategory_button.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/location_text_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/widget/show_mbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    debugPrint('--HomeView: build');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //
          //Üst kısım
          //
          Expanded(
            flex: 2,
            child: Container(
              decoration: customContainerDeceration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(ApplicationStrings.prfilImage),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonLocation(
                        onPressed: () {
                          CustomModalBottomSheet.showAddressModal(context);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      HomeViewTextfield(searchController: searchController),
                      const FilterButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //
          //Alt kısım
          //
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                  child: kategoriBuilder(),
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomeLoaded) {
                        return girdBuilder(state);
                      }
                      return const Center(
                        child: Text(ApplicationStrings.hata),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GridView girdBuilder(HomeLoaded state) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 90),
      itemCount: state.listCoffee.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 320,
      ),
      itemBuilder: (context, index) {
        final listCoffee = state.listCoffee[index];
        return CoffeeCard(
          coffee: listCoffee,
        );
      },
    );
  }

  ListView kategoriBuilder() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 10, top: 10),
      scrollDirection: Axis.horizontal,
      itemCount: kategoriList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final kategori = kategoriList[index];
        return KategoryButton(
          title: kategori.title,
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(HomeKategoryEvent(message: kategori.event));
          },
        );
      },
    );
  }
}
