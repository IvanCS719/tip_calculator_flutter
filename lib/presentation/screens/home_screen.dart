import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tip_calculator/presentation/providers/tip_calculator_provider.dart';
import 'package:tip_calculator/presentation/widgets/home/total_account_field_box.dart';
import 'package:tip_calculator/presentation/widgets/home/result_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAccountP = ref.watch(totalAccountProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Propinas'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResultCard(totalAccountP: totalAccountP),

                const SizedBox(
                  height: 28.0,
                ),

                const Text('Total de la cuenta'),

                const SizedBox(
                  height: 12.0,
                ),

                const TotalAccountFieldBox(),

                const SizedBox(
                  height: 28.0,
                ),

                const Text('Propina'),
                
                const SizedBox(
                  height: 12.0,
                ),

                const TipSlider(),

                const SizedBox(
                  height: 8.0,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TipPercentButton(percent: 10,),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: TipPercentButton(percent: 15,),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: TipPercentButton(percent: 20,),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28.0,
                ),
                const Text('Dividir cuenta'),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_outlined),
                      style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Personaliza el border radius aquí
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 28.0)
                      )
                      ),
                    ),
                    const SizedBox(width: 8.0,),
            
                    const Expanded(
                      child: NumberPeopleFieldBox()
                    ),
                    
                    const SizedBox(width: 8.0,),
                    
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.add_outlined),
                      style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Personaliza el border radius aquí
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 28.0)
                      )
                     
                      ),
                    ),
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

class NumberPeopleFieldBox extends StatelessWidget {
  const NumberPeopleFieldBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(8)
    );
    final inputDecoration = InputDecoration(
        hintText: '0',
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer);
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      textAlign: TextAlign.center,
      decoration: inputDecoration,
      initialValue: 2.toString(),
    );
  }
}

class TipPercentButton extends StatelessWidget {

  final int percent;

  const TipPercentButton({
    super.key,
    required this.percent
  });

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: (){},
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        )
        
      ),
      child: Text('$percent%'),
      );
  }
}

class TipSlider extends StatefulWidget {
  const TipSlider({
    super.key,
  });

  @override
  State<TipSlider> createState() => _TipSliderState();
}

class _TipSliderState extends State<TipSlider> {
  double _currentSliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    const minValueSlider = 0.0;
    const maxValueSlider = 50.0;
    return Column(
      children: [
        Text('${_currentSliderValue.toInt()}%'),
        const SizedBox(height: 6.0,),
        Row(
          children: [
            Text('${minValueSlider.toInt()}%'),
            Expanded(
              child: Slider(
                value: _currentSliderValue,
                onChanged: (double value){
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                min: minValueSlider,
                max: maxValueSlider,
                label: '$_currentSliderValue',
                ),
            ),
            Text('${maxValueSlider.toInt()}%')
          ],
        ),
      ],
    );
  }
}
