import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  final void Function(int) getTipPercentSlider;
  final double currentSliderValue;

  const TipSlider({
    super.key,
    required this.getTipPercentSlider,
    required this.currentSliderValue,
  });

  @override
  Widget build(BuildContext context) {
    const minValueSlider = 0.0;
    const maxValueSlider = 50.0;
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            width: 100.0,
            child: Text('${currentSliderValue.toInt()}%', style: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500)),
          ),
        ),
        const SizedBox(height: 6.0,),
        Row(
          children: [
            Text('${minValueSlider.toInt()}%'),
            Expanded(
              child: Slider(
                value: currentSliderValue,
                onChanged: (double value) {
                  getTipPercentSlider(value.toInt());
                },
                min: minValueSlider,
                max: maxValueSlider,
                label: '$currentSliderValue',
              ),
            ),
            Text('${maxValueSlider.toInt()}%')
          ],
        ),
      ],
    );
  }
}