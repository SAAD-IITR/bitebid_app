import 'package:flutter/material.dart';

class BudgetSlider extends StatefulWidget {
  const BudgetSlider({Key? key}) : super(key: key);

  @override
  State<BudgetSlider> createState() => _BudgetSliderState();
}

class _BudgetSliderState extends State<BudgetSlider> {
  double _currentValue = 1100;
  final double _minValue = 200;
  final double _maxValue = 2000;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Budget',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹${_minValue.toInt()} - ₹${_maxValue.toInt()}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.orange[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.orange[700],
            inactiveTrackColor: Colors.grey[200],
            thumbColor: Colors.orange[700],
            overlayColor: Colors.orange.withOpacity(0.2),
            trackHeight: 4.0,
          ),
          child: Slider(
            value: _currentValue,
            min: _minValue,
            max: _maxValue,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
