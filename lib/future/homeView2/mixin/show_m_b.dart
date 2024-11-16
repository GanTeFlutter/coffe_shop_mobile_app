import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

mixin ShowModalBottomSheetMixin<T extends StatefulWidget> on State<T> {
  /// Modal Bottom Sheet Gösterimi
  Future<dynamic> showModalBottomSheetCustom(double height) {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.7),
      isScrollControlled: true,
      backgroundColor: ApplicationColors.acikbeyaz,
      context: context,
      builder: (context) {
        return SizedBox(
          height: height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createElevatedButton(
                text: 'En yakın Caffee',
                isIcon: false,
                onPressed: () {

                },
              ),
              createElevatedButton(
                text: 'En çok tercih edilen Caffee',
                isIcon: false,
                onPressed: () {},
              ),
              createElevatedButton(
                text: 'Aderes Seç',
                isIcon: true,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }


  Widget createElevatedButton({
    required String text,
    required bool isIcon,
    required VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ApplicationColors.kahve),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(width: 2, color: ApplicationColors.ten),
          ),
          overlayColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.2)),
        ),
        onPressed: onPressed,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(color: ApplicationColors.white),
              ),
              const SizedBox(width: 10),
              if (isIcon)
                const Icon(
                  Icons.location_on_rounded,
                  color: ApplicationColors.white,
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
