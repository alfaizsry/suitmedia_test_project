import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({Key? key, required this.controller, required this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 7,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: const Color(0xFFE2E3E4),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Color(0x6867775C),
          )),
    );
  }
}
