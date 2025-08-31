import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberPeopleFieldBox extends StatefulWidget {
  final int splitBill;
  final void Function(int) cambiarSplitBill;

  const NumberPeopleFieldBox({
    super.key,
    required this.splitBill,
    required this.cambiarSplitBill
  });

  @override
  State<NumberPeopleFieldBox> createState() => _NumberPeopleFieldBoxState();
}

class _NumberPeopleFieldBoxState extends State<NumberPeopleFieldBox> {
  late final TextEditingController _controller;
  late int _currentValue;

  final underlineInputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  void initState() {
    super.initState();
    _currentValue = widget.splitBill <= 0 ? 1 : widget.splitBill;
    _controller = TextEditingController(text: _currentValue.toString());
  }

  @override
  void didUpdateWidget(covariant NumberPeopleFieldBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Si cambia la propiedad splitBill, actualizamos el controlador
    if (widget.splitBill != oldWidget.splitBill) {
      _currentValue = widget.splitBill <= 0 ? 1 : widget.splitBill;
      _controller.text = _currentValue.toString();
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      hintText: '1',
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceContainer,
    );

    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textAlign: TextAlign.center,
      decoration: inputDecoration,
      onChanged: (value) {
        int parsed = int.tryParse(value) ?? 1;
        if (parsed <= 0) {
          parsed = 1;
          _controller.text = parsed.toString();
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
        _currentValue = parsed;
        widget.cambiarSplitBill(parsed);
        // Aquí puedes notificar a algún callback si lo necesitas
      },
    );
  }
}