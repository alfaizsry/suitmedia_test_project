import 'package:flutter/material.dart';

class CustomButtonBlue extends StatefulWidget {
  const CustomButtonBlue({Key? key, required this.onTap, required this.label})
      : super(key: key);

  final Function() onTap;
  final String label;
  @override
  State<CustomButtonBlue> createState() => _CustomButtonBlueState();
}

class _CustomButtonBlueState extends State<CustomButtonBlue> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF2B637B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(widget.label, textAlign: TextAlign.center, style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}
