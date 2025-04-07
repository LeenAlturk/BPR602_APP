import 'package:bpr602_cinema/Constants/colors.dart';
import 'package:bpr602_cinema/Constants/sizer.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const CustomFilterChip({super.key, 
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label , style: TextStyle(
        fontSize: 14.sp
      ),),
      selected: isSelected,
      onSelected: (selected) => onSelected(),
      backgroundColor: Colors.grey[800],
      selectedColor: kbutton,
      labelStyle: TextStyle(
        color: isSelected ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: kbutton),
      ),
      checkmarkColor: Colors.black,
    );
  }
}
