import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// Widget para el campo de texto donde el usuario ingresa el total de la cuenta.
class TotalAccountFieldBox extends StatefulWidget {
  final ValueChanged<String> onInitialTotalAccount;

  const TotalAccountFieldBox({
    super.key,
    required this.onInitialTotalAccount
    });

  @override
  State<TotalAccountFieldBox> createState() => _TotalAccountFieldBoxState();
}

class _TotalAccountFieldBoxState extends State<TotalAccountFieldBox> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(8)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Ingresa el total de la cuenta',
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceContainer,
      prefixIcon: const Icon(Icons.attach_money_outlined),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
    );

    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _controller,
      decoration: inputDecoration,
      onChanged: widget.onInitialTotalAccount,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}