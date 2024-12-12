// // ignore_for_file: public_member_api_docs

// import 'package:coffe_shop_mobile_app/future/coffee_detail/coffee_detail_view.dart';
// import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
// import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BasketView extends StatefulWidget {
//   const BasketView({super.key});

//   @override
//   State<BasketView> createState() => _BasketViewState();
// }

// class _BasketViewState extends State<BasketView> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Deneme'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 300,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     // ignore: inference_failure_on_instance_creation
//                     MaterialPageRoute(
//                       builder: (context) => const CoffeeDetailView(
//                         coffee: Coffee(
//                           id: '1',
//                           name: 'Espresso',
//                           image: 'assets/coffee/ebk/codee_image (5).jpg',
//                           price: '5.00',
//                           extra: 'Ice/Hot',
//                           rating: 4,
//                           description:
//                               'Espresso is a coffee-making method of Italian origin, in which a small amount of nearly boiling water is forced under pressure through finely-ground coffee beans.',
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 child: Hero(
//                   tag: 'hero1',
//                   child: Container(
//                     height: size.height * 0.2,
//                     width: size.width * 0.3,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.grey,
//                           offset: Offset(0, 10),
//                           blurRadius: 10,
//                         ),
//                       ],
//                       image: const DecorationImage(
//                         image: AssetImage('assets/coffee/ebk/codee_image (5).jpg'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'Coffee Mocha',
//               style: GoogleFonts.babylonica(
//                 textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       color: ApplicationColors.black,
//                       fontWeight: FontWeight.w600,
//                     ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
