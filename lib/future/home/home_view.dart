import 'package:coffe_shop_mobile_app/future/home/bloc/home_bloc.dart';
import 'package:coffe_shop_mobile_app/future/home/home_view_model.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/coffee_card.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/custom_textfield.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/filter_button.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/location_text_button.dart';
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
    final blocService = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
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
                  TextButtonLocation(onPressed: () {}),
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
                  height: 50,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: kategoriList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final kategori = kategoriList[index];
                      return ElevatedButton(
                        onPressed: () {
                          blocService.add(HomeInitialEvent(message: kategori.title));
                        },
                        child: Text(kategori.title),
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
}
