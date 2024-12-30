import 'package:coffe_shop_mobile_app/future/favori/bloc/favorite_bloc.dart';
import 'package:coffe_shop_mobile_app/future/favori/favorite_coffees_view_model.dart';
import 'package:coffe_shop_mobile_app/future/home/widget/coffee_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCoffeesView extends StatefulWidget {
  const FavoriteCoffeesView({super.key});

  @override
  State<FavoriteCoffeesView> createState() => _FavoriteCoffeesViewState();
}

class _FavoriteCoffeesViewState extends FavoriteCoffeesViewModel {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.05),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteInitial) {
                  return const Center(
                    child: Text('Favori kahveleriniz bulunmamaktadır.'),
                  );
                } else if (state is FavoriteLoaded) {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return ListView.builder(
                        itemCount: state.favoriteList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.favoriteList[index].name ?? 'Bilinmeyen'),
                            subtitle: Text(state.favoriteList[index].description ?? 'Bilinmeyen'),
                            leading: IconButton(
                              onPressed: () {},
                              icon: const Text('Sil'),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is FavoriteErrorState) {
                  return const Center(
                    child: Text('Bir hata oluştu.'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*

 ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.favoriteList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.favoriteList[index].name ?? 'Bilinmeyen'),
                          subtitle: Text(state.favoriteList[index].description ?? 'Bilinmeyen'),
                          leading: IconButton(
                            onPressed: () {
                              Provider.of<FavoriteBloc>(context, listen: false).add(RemoveFavorite(state.favoriteList[index]));
                            },
                            icon: const Text('Sil'),
                          ),
                        );
                      },
                    ),
*/
