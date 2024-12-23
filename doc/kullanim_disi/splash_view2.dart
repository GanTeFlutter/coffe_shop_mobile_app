// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   Widget build(BuildContext context) {
//     final paddingHeight = MediaQuery.of(context).size.height * 0.02;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             const Image(
//               fit: BoxFit.scaleDown,
//               image: AssetImage('assets/image/splash/aiCoffee.jpg'),
//             ),
//             linearGradient(),
//             bottomTextsAndButton(context, paddingHeight),
//           ],
//         ),
//       ),
//     );
//   }

//   Container linearGradient() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.transparent,
//             // ignore: deprecated_member_use
//             ApplicationColors.black.withOpacity(0.9),
//             // ignore: deprecated_member_use
//             ApplicationColors.black.withOpacity(0.9),
//             ApplicationColors.black,
//           ],
//         ),
//       ),
//     );
//   }

//   Positioned bottomTextsAndButton(BuildContext context, double paddingHeight) {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           children: [
//             Text(
//               ApplicationStrings.splashTitleText,
//               textAlign: TextAlign.center,
//               style: GoogleFonts.b612(
//                 textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
//                       color: ApplicationColors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//             ),
//             SizedBox(height: paddingHeight),
//             Text(
//               ApplicationStrings.splashTitleText2,
//               textAlign: TextAlign.center,
//               style: GoogleFonts.b612(
//                 // Burada istediğiniz fontu belirleyebilirsiniz
//                 textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                       color: ApplicationColors.grey,
//                       fontWeight: FontWeight.w100,
//                     ),
//               ),
//             ),
//             SizedBox(height: paddingHeight),
//             customButton.CustomElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const BottomNavigationBarScreenV2(),
//                   ),
//                 );
//               },
//               text: ApplicationStrings.splashbuttonText,
//               borderRadius: 20,
//             ),
//             SizedBox(height: paddingHeight * 2),
//           ],
//         ),
//       ),
//     );
//   }
// }
