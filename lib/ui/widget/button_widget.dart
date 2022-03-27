import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key, this.onTap, this.text}) : super(key: key);
  String? text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 20)],
            color: Colors.blueAccent),
        child: Text(
          text!,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
