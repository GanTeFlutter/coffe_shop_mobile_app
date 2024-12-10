import 'package:flutter/material.dart';

/// Detail sayfasındaki kahvenin boyut değişimleri
class CoffeeDetailSizeChange extends StatefulWidget {
  const CoffeeDetailSizeChange({required this.onChanged, super.key});
  final void Function(String size) onChanged;

  @override
  State<CoffeeDetailSizeChange> createState() => _CoffeeDetailSizeChangeState();
}

class _CoffeeDetailSizeChangeState extends State<CoffeeDetailSizeChange> {
  String selectedSize = 'M'; // Varsayılan boyut

  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: sizes.map((size) {
        final isSelected = selectedSize == size;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
            widget.onChanged(size);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.brown : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              size,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
