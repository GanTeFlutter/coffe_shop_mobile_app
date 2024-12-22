// ignore_for_file: inference_failure_on_instance_creation

import 'package:coffe_shop_mobile_app/future/splash/splash_onboarding_view_model.dart';
import 'package:coffe_shop_mobile_app/future/splash/widget/splash_custom_ink_button.dart';
import 'package:coffe_shop_mobile_app/product/constant/app_custom_text_style.dart';
import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class SplashOnboardingView extends StatefulWidget {
  const SplashOnboardingView({super.key});

  @override
  State<SplashOnboardingView> createState() => _SplashOnboardingViewState();
}

class _SplashOnboardingViewState extends SplashOnboardingViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          pageBuilder(size),
          //Skip Button
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SplashCustomInkButton(
                  onTap: actionNextScreen,
                  text: 'Skip >',
                  cardColor: ApplicationColors.white,
                  textColor: ApplicationColors.kahve,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: size.height * 0.05,
            child: Column(
              spacing: 30,
              children: [
                //Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageModelList.map((obj) {
                    final index = pageModelList.indexOf(obj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: index == selectPage ? ApplicationColors.kahve : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.amber),
                      ),
                    );
                  }).toList(),
                ),
                //Next Button
                SplashCustomInkButton(
                  onTap: goToNewPage,
                  text: 'Next',
                  cardColor: ApplicationColors.kahve,
                  textColor: ApplicationColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageView pageBuilder(Size size) {
    return PageView.builder(
      controller: controller,
      itemCount: pageModelList.length,
      onPageChanged: (page) {
        setState(() {
          selectPage = page;
        });
      },
      itemBuilder: (context, index) {
        final page = pageModelList[index];
        return Column(
          spacing: 20,
          children: [
            SizedBox(
              height: size.width * 0.4,
            ),
            Card(
              color: Colors.white,
              child: Image.asset(
                page.image,
                width: size.width * 0.8,
                height: size.width * 0.8,
              ),
            ),
            Text(page.title, style: AppCustomTextStyle.coffeeCardName(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                page.description,
                textAlign: TextAlign.center,
                style: AppCustomTextStyle.bodyMedium(context),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
