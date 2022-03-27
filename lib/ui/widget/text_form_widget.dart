import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget(
      {Key? key,
      this.icon,
      this.text,
      this.keyboard,
      this.suffixIcon,
      this.controller})
      : super(key: key);
  TextEditingController? controller;
  String? text;
  Widget? icon;
  Widget? suffixIcon;
  TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(text!),
        icon: icon,
      ),
    );
  }
}
