// ignore_for_file: deprecated_member_use

import 'package:coffe_shop_mobile_app/product/constant/application_colors.dart';
import 'package:coffe_shop_mobile_app/product/state/indirim.dart/indirim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndirimBurtton extends StatefulWidget {
  const IndirimBurtton({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  State<IndirimBurtton> createState() => _IndirimBurttonState();
}

class _IndirimBurttonState extends State<IndirimBurtton> {
  final TextEditingController _controller = TextEditingController();
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your voucher code'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Sadece bir indirim kodu kullanabilirsiniz.'),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Kodunuzu girin',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Uygula'),
              onPressed: () {
                if (_controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lütfen bir kod girin.'),
                    ),
                  );
                } else {
                  context.read<Indirim>().setSelectedIndex(visible: true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Kod başarıyla uygulandı.'),
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _showMyDialog();
      },
      child: Container(
        height: 70,
        width: widget.size.width * 0.9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ApplicationColors.acikbeyaz,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ApplicationColors.kahve.withOpacity(0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconIndirim(
              Icons.percent_rounded,
              25,
            ),
            const SizedBox(width: 12),
            Text(
              context.watch<Indirim>().isIndirimButtonVisible
                  ? 'İndirim Kodu Kullanıldı'
                  : 'Enter your discount coupon',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ApplicationColors.kahve,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(width: 12),
            iconIndirim(
              Icons.arrow_forward_ios_rounded,
              20,
            ),
          ],
        ),
      ),
    );
  }

  Container iconIndirim(IconData? icon, double? size) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ApplicationColors.kahve.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: ApplicationColors.kahve,
        size: size,
      ),
    );
  }
}
