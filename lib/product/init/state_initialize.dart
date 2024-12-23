// ignore_for_file: lines_longer_than_80_chars, require_trailing_commas

import 'package:coffe_shop_mobile_app/future/basket/state/bloc/basket_bloc.dart';
import 'package:coffe_shop_mobile_app/future/basket/state/provider/indirim.dart';
import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/state/page_provider.dart';
import 'package:coffe_shop_mobile_app/future/home/bloc/home_bloc.dart';
import 'package:coffe_shop_mobile_app/future/profile/address/addressBloc/address_bloc.dart';
import 'package:coffe_shop_mobile_app/future/profile/address/singleAddressBloc/single_address_bloc_bloc.dart';
import 'package:coffe_shop_mobile_app/product/enums/e.firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Bloc
        BlocProvider(
          create: (context) =>
              HomeBloc()..add(HomeKategoryEvent(message: FirebaseCollDocName.sk.name)),
        ),
        BlocProvider(
          create: (context) => AddressBloc()..add(LoadAddressList()),
        ),
        BlocProvider(
          create: (context) => SingleAddressBloc(),
        ),
        BlocProvider(
          create: (context) => BasketBloc(),
        ),
        //Provider  
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(create: (context) =>  Indirim(),)
      ],
      child: child,
    );
  }
}
