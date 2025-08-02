import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tip_calculator/presentation/providers/tip_calculator_provider.dart';


class TotalAccountFieldBox extends ConsumerStatefulWidget {
  const TotalAccountFieldBox({super.key});

  @override
  ConsumerState<TotalAccountFieldBox> createState() => _TotalAccountFieldBoxState();
}

class _TotalAccountFieldBoxState extends ConsumerState<TotalAccountFieldBox> {
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
      onChanged: (value) {
        final doubleValue = double.tryParse(value) ?? 0.0;
        ref.read(totalAccountProvider.notifier).state = doubleValue;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}