import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final double height;
  const TextFieldWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 350,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Title',
            hintText: 'Enter title here...'),
      ),
    );
    ;
  }
}
