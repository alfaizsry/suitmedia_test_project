import 'package:flutter/material.dart';

class CustomAppbar {
  CustomAppbar({required this.context});
  final BuildContext context;

  AppBar defaultType(String label) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 32,
          ),
          tooltip: "Kembali",
          onPressed: () => Navigator.of(context).pop()),
      title: Text(
        label,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      elevation: 1,
    );
  }
}
