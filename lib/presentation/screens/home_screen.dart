import 'package:flutter/material.dart';
import 'package:tip_calculator/domain/entities/tip_calculator.dart';
import 'package:tip_calculator/presentation/widgets/home/number_people_field_box.dart';
import 'package:tip_calculator/presentation/widgets/home/split_bill_button.dart';
import 'package:tip_calculator/presentation/widgets/home/tip_percent_button.dart';
import 'package:tip_calculator/presentation/widgets/home/tip_slider.dart';
import 'package:tip_calculator/presentation/widgets/home/total_account_field_box.dart';
import 'package:tip_calculator/presentation/widgets/home/result_card.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final void Function() toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tipCalEntitie = TipCalculator();
  double _currentSliderValue = 0.0;
  int _splitBill = 1;

  void actualizarTotalAccount(String total) {
    final newTotal = double.tryParse(total) ?? 0.0;
    setState(() {
      tipCalEntitie.showTotalAccount(newTotal);
      establecerSplitBill();
    });
  }

  void actualizarTipPercent(int value) {
    setState(() {
      _currentSliderValue = value.toDouble();
      tipCalEntitie.tipPercent = value;
      tipCalEntitie.calculateTipTotal();
      establecerSplitBill();
    });
  }

  void incrementarSplitBill() {
    setState(() {
      _splitBill++;
      establecerSplitBill();
    });
  }

  void decrementarSplitBill() {
    setState(() {
      if (_splitBill > 1) _splitBill--;
      establecerSplitBill();
    });
  }

  void cambiarSplitBill(int value) {
    setState(() {
      _splitBill = value;
      establecerSplitBill();
    });
  }

  void establecerSplitBill() {
    tipCalEntitie.calculateSplitBill(_splitBill);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Propinas'),
        actions: [
          IconButton(
              onPressed: () {widget.toggleTheme();}, icon: Icon(
                widget.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined
                ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResultCard(
                    totalAccountWithTip: tipCalEntitie.totalAccountWithTip,
                    tipTotal: tipCalEntitie.tipTotal,
                    totalAccountSplitBill: tipCalEntitie.totalAccountSplitBill),
                const SizedBox(
                  height: 32.0,
                ),
                const Text('Total de la cuenta', style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 12.0,
                ),
                TotalAccountFieldBox(
                  onInitialTotalAccount: actualizarTotalAccount,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Text('Propina', style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 12.0,
                ),
                TipSlider(
                  getTipPercentSlider: actualizarTipPercent,
                  currentSliderValue: _currentSliderValue,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TipPercentButton(
                          percent: 10,
                          getTipPercentButton: actualizarTipPercent),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TipPercentButton(
                          percent: 15,
                          getTipPercentButton: actualizarTipPercent),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TipPercentButton(
                          percent: 20,
                          getTipPercentButton: actualizarTipPercent),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Text('Dividir cuenta', style: TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    SplitBillButton(splitBillFunc: decrementarSplitBill, icon: Icons.remove_outlined),
                    
                    const SizedBox(
                      width: 8.0,
                    ),

                    Expanded(
                        child: NumberPeopleFieldBox(
                      splitBill: _splitBill,
                      cambiarSplitBill: cambiarSplitBill,
                    )),

                    const SizedBox(
                      width: 8.0,
                    ),

                    SplitBillButton(splitBillFunc: incrementarSplitBill, icon: Icons.add_outlined),
                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
