import 'package:coffe_shop_mobile_app/future/home/home_view_model.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_strings.dart';
import 'package:coffe_shop_mobile_app/product/widget/home_view/home_view_coffee_card.dart';
import 'package:coffe_shop_mobile_app/product/widget/home_view/home_view_textbutton_icon_location.dart';
import 'package:coffe_shop_mobile_app/product/widget/home_view/home_view_textfield.dart';
import 'package:coffe_shop_mobile_app/product/widget/home_view/show_bottomshhet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    var screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ApplicationColors.acikbeyaz,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: titleExpandetSize1,
                child: Container(
                  width: double.infinity,
                  decoration: containerDeceration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 0),
                          child: Text(ApplicationStrings.location,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: ApplicationColors.grey)),
                        ),
                        HomeViewTextButtonIconLocation(
                          onPressed: () {
                            showModalBottomSheetCustom(screenHeigth);
                            debugPrint('Location');
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: HomeViewTextfield(),
                            ),
                            const SizedBox(width: 10),
                            filterButton()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: bottomExpandetSize,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    caffeeCesitleri(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 0, bottom: 100),
                        itemCount: 5,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return const HomeViewCoffeeCard();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          //Renklam için ş
          banner
              ? GestureDetector(
                  onTap: banerisCheek, child: screenBanner(context))
              : Container(),
        ],
      ),
    );
  }

  SizedBox caffeeCesitleri() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: coffeeList.length,
        itemBuilder: (context, index) {
          final String item = coffeeList[index];
          bool isSelected = caffeFilter == index;
          return GestureDetector(
            onTap: () => setState(() => caffeFilter = index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 120,
                  color: isSelected ? ApplicationColors.kahve : null,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.arima(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: isSelected
                                    ? ApplicationColors.white
                                    : ApplicationColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showModalBottomSheetCustom(double height) {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.7),
      isScrollControlled: true,
      backgroundColor: ApplicationColors.acikbeyaz,
      enableDrag: true,
      context: context,
      builder: (context) {
        return SizedBox(
            height: height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {},
                  text: 'En yakın Caffee',
                  isIcon: false,
                ),
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {},
                  text: 'En çok tercih edilen Caffee',
                  isIcon: false,
                ),
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {},
                  text: 'Kendin Seç',
                  isIcon: true,
                ),
              ],
            ));
      },
    );
  }

  Widget filterButton() {
    return GestureDetector(
      onTap: () {
        debugPrint('Filter');
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: ApplicationColors.kahve,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.blur_on_sharp,
          color: ApplicationColors.white,
          size: 30,
        ),
      ),
    );
  }

  Align screenBanner(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.3),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/icon/banner.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ApplicationColors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width *
            0.9, // Ekran genişliğine göre ayar
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: const BoxDecoration(
                  color: ApplicationColors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  'Promo',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ApplicationColors.white,
                        backgroundColor: ApplicationColors.red,
                      ),
                ),
              ),
              Text('Buy one get one free',
                  style: GoogleFonts.b612(
                    textStyle:
                        Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ApplicationColors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(1.5, 1.5),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        Shadow(
                          offset: const Offset(-1.5, -1.5),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenCustomPadding {}

class ScreenCustomContainerDeceration {
  BoxDecoration customContainerDeceration() {
    return BoxDecoration(
      color: ApplicationColors.kahvesiyah,
      boxShadow: [
        BoxShadow(
          color: ApplicationColors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ApplicationColors.black,
            ApplicationColors.kahvesiyah,
          ]),
    );
  }
}
