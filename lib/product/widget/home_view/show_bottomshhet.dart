import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheetElevatedButton extends StatefulWidget {
  const ShowModalBottomSheetElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isIcon});

  final void Function()? onPressed;
  final String text;
  final bool isIcon;
  @override
  State<ShowModalBottomSheetElevatedButton> createState() =>
      _ShowModalBottomSheetElevatedButtonState();
}

class _ShowModalBottomSheetElevatedButtonState
    extends State<ShowModalBottomSheetElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ApplicationColors.kahve),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            side: WidgetStateProperty.all(
                const BorderSide(width: 2, color: ApplicationColors.ten)),
            overlayColor:
                WidgetStateProperty.all(Colors.grey.withOpacity(0.2))),
        onPressed: widget.onPressed,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // İkon ve metni ortalar
            children: [
              Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ApplicationColors.white),
              ),
              const SizedBox(width: 10),
              widget.isIcon
                  ? const Icon(
                      Icons.location_on_rounded,
                      color: ApplicationColors.white,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
