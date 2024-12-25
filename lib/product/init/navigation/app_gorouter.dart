import 'package:coffe_shop_mobile_app/future/bootom_nav_bar/bottom_navigation_bar.dart';
import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
import 'package:coffe_shop_mobile_app/future/profile/address/add_new_address.dart';
import 'package:coffe_shop_mobile_app/future/splash/splash_onboarding_view.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const BottomNavigationBarScreenV2(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const BottomNavigationBarScreenV2(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            final coffee = state.extra! as Coffee;
            return CoffeeDetailView(
              coffee: coffee,
            );
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) {
            return const AddNewAddress();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/LoaddeNEM',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
