import 'package:flutter/material.dart';

class SplitBillButton extends StatelessWidget {

  final VoidCallback splitBillFunc;
  final IconData icon;

  const SplitBillButton({
    super.key,
    required this.splitBillFunc,
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: splitBillFunc,
      icon: Icon(icon),
      style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Personaliza el border radius aquí
            ),
          ),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 28.0))),
    );
  }
}